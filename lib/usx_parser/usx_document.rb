module UsxParser
  class UsxDocument < Nokogiri::XML::SAX::Document
    def start_document
      @usx_version = nil
      @current_tag = nil
      @current_style = nil
      @styles = {}
      @book = nil
      @chapter_number = nil
      @verse = nil
      @verse_end = false
      @verse_text = ""
      @verses = []
    end

    def start_element(name, attrs = [])
      attrs = attrs.to_h
      @current_tag = name

      case name
      when 'usx'
        @usx_version = attrs['version']
      when 'book'
        @book = UsxParser::Book.find_by_code(attrs['code'])
        raise UsxParser::Error, "BookNotFound" if @book.nil?
      when 'para', 'char'
        @current_style = attrs['style']
        @styles[name] ||= {}
        @styles[name][@current_style] ||= 0
        @styles[name][@current_style] += 1
      when 'chapter'
        @chapter_number = attrs['number']
      when 'verse'
        if @usx_version == '3.0' && attrs['eid'] != nil
          @verse_end = true
          @verse.text = @verse_text
          @verses << @verse.to_h
        else
          if @usx_version != '3.0' && !@chapter_number.nil? && !@verse&.verse_number.nil?
            @verse.text = @verse_text
            @verses << @verse.to_h
          end
          @verse_text = ''
          @verse_end = false
          @verse = UsxParser::Verse.new(chapter_number: @chapter_number, verse_number: attrs['number'], book: @book)
        end
      end
    end

    def characters(string)
      str = string.gsub('¶', '').strip
      case @current_tag
      when 'verse'
        @verse_text += str unless @verse_end
      when 'char'
        return if @current_style =~ /^(f|x).*/i
        if @current_style&.strip.nil?
          @verse_text += str
        else
          @verse_text += "<span class=\"#{@current_style}\">#{str}</span>"
        end
      end
    end

    def end_element(name)
      @current_style = nil
    end

    def end_document
      if @usx_version != '3.0' && !@chapter_number.nil? && !@verse&.verse_number.nil?
        @verse.text = @verse_text.strip
        @verses << @verse.to_h
      end
    end

    def verses
      return @verses
    end
  end
end