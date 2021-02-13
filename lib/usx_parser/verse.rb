module UsxParser
  class Verse
    attr_accessor :chapter_number, :verse_number, :text, :book

    def initialize(chapter_number: nil, verse_number: nil, text: '', book: nil)
      self.chapter_number = chapter_number.to_i
      self.verse_number = verse_number.to_i
      self.text = text
      self.book = book
    end

    def to_h
      {
        scripture_book: book.ordinal,
        scripture_chapter: chapter_number,
        scripture_verse: verse_number,
        text: text,
        position: "#{book.name} #{chapter_number}:#{verse_number}"
      }
    end
  end
end