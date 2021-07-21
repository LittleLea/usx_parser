module UsxParser
  class Verse
    attr_accessor :chapter_number, :verse_number, :text, :book, :book_name

    def initialize(chapter_number: nil, verse_number: nil, text: '', book: nil, book_name: nil)
      self.chapter_number = chapter_number.to_i
      self.verse_number = verse_number
      self.text = text
      self.book = book
      self.book_name = book_name
    end

    def to_h
      {
        scripture_book: book&.ordinal,
        scripture_chapter: chapter_number,
        scripture_verse: verse_number,
        text: text,
        position: position
      }
    end

    def position
      "#{book_name} #{chapter_number}:#{verse_number}"
    end
  end
end
