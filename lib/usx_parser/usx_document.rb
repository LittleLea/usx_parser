module UsxParser
  class UsxDocument < Nokogiri::XML::SAX::Document
    attr_accessor :verbose

    def initialize(verbose: false)
      self.verbose = verbose
    end

    def start_document
      @usx_version = nil
      @elements = []
      @current_tag = nil
      @current_style = nil
      @para_style = nil
      @styles = {}
      @book_name = nil
      @book = nil
      @chapters = []
      @chapter_number = nil
      @verse = nil
      @verse_end = false
      @verse_text = ""
      @in_note = false
      @verses = []
      @cell_align = nil
    end

    def start_element(name, attrs = [])
      puts "start_element: #{name}, (attrs: #{attrs})" if verbose
      attrs = attrs.to_h
      @current_tag = name

      @elements.push(name)

      case name
      when 'usx'
        @usx_version = attrs['version']
      when 'book'
        @book = UsxParser::Book.find_by_code(attrs['code'])
        @book_name = ""
      when 'para', 'char'
        @current_style = attrs['style']
        @styles[name] ||= {}
        @styles[name][@current_style] ||= 0
        @styles[name][@current_style] += 1
        @para_style = attrs['style'] if name == 'para'
      when 'cell'
        @cell_align = attrs['align']
      when 'chapter'
        if !@chapter_number.nil? && !@verse&.verse_number.nil? && @verse_text != nil && @verse_text != ''
          @verse.text = @verse_text.gsub(/\s{2,}/, ' ').strip
          @verses << @verse.to_h if @verses.select{ |v| v[:position] == @verse.position }.empty?
          @chapters << { book_name: @book_name, chapter_number: @chapter_number }
        end
        @verse_text = ''
        @verse_end = false
        @verse = nil

        @chapter_number = attrs['number'].to_i
      when 'verse'
        if @usx_version == '3.0' && attrs['eid'] != nil && @verse != nil
          @verse_end = true
          @verse.text = @verse_text.gsub(/\s{2,}/, ' ').strip
          @verses << @verse.to_h if @verses.select{ |v| v[:position] == @verse.position }.empty?
        else
          if @usx_version != '3.0' && !@chapter_number.nil? && !@verse&.verse_number.nil? && @verse_text != nil && @verse_text != ''
            @verse.text = @verse_text.gsub(/\s{2,}/, ' ').strip
            @verses << @verse.to_h if @verses.select{ |v| v[:position] == @verse.position }.empty?
          end
          @verse_text = ''
          @verse_end = false
          @verse = UsxParser::Verse.new(chapter_number: @chapter_number, verse_number: attrs['number'], book: @book, book_name: @book_name)
        end
      end
    end

    def characters(string)
      puts "characters: #{string} - elements: #{@elements} - para style: #{@para_style}" if verbose

      str = string.gsub('¶', '')
      @current_tag = @elements[-1]

      case @current_tag
      when 'verse'
        @verse_text += str unless @verse_end
      when 'cell'
        @verse_text += str.strip
        if @cell_align == 'end'
          @verse_text += "; " unless str.strip[-1] =~ %r{\W$}
        elsif str.strip != ""
          if str.strip[-1] =~ %r{\W$}
            @verse_text += " "
          else
            @verse_text += ", "
          end
        end
      when 'para'
        @verse_text += str unless title_or_heading?(@para_style)
        @book_name += str if @para_style == 'toc2'
      when 'char'
        return if @current_style =~ /^(f|x).*/i
        return if @elements.include?('note')

        if @current_style&.strip.nil?
          @verse_text += str
        else
          @verse_text += "<span class=\"#{@current_style}\">#{str}</span>"
        end
      end
    end

    def end_element(name)
      @elements.pop

      if name == 'para'
        @para_style = nil
        @verse_text += " "
      elsif name == 'cell'
        @cell_align = nil
        @verse_text += " "
      end

      puts "end_element: #{name}" if verbose
    end

    def end_document
      puts "end_document" if verbose
      if @usx_version != '3.0' && !@chapter_number.nil? && !@verse&.verse_number.nil?
        @verse.text = @verse_text.gsub(/\s{2,}/, ' ').strip
        @verses << @verse.to_h if @verses.select{ |v| v[:position] == @verse.position }.empty?
      end
    end

    def verses
      return @verses
    end

    def chapters
      return @chapters
    end

    private

    def title_or_heading?(tag_name)
      case tag_name
      when /^mt/
        true
      when /^ms/
        true
      when /^s/
        true
      when 'cl', 'cd', 'r', 'd'
        true
      else
        false
      end
    end
  end
end
