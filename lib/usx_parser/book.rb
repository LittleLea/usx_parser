module UsxParser
  class Book
    attr_accessor :code, :ordinal, :name

    def initialize(code: nil, ordinal: nil, name: nil)
      self.code = code
      self.ordinal = ordinal
      self.name = name
    end

    def self.find_by_code(code)
      return nil if code.nil?

      case code.upcase
      when 'GEN'
        @ordinal = 1
        @name = 'Genesis'
      when 'EXO'
        @ordinal = 2
        @name = 'Exodus'
      when 'LEV'
        @ordinal = 3
        @name = 'Leviticus'
      when 'NUM'
        @ordinal = 4
        @name = 'Numbers'
      when 'DEU'
        @ordinal = 5
        @name = 'Deuteronomy'
      when 'JOS'
        @ordinal = 6
        @name = 'Joshua'
      when 'JDG'
        @ordinal = 7
        @name = 'Judges'
      when 'RUT'
        @ordinal = 8
        @name = 'Ruth'
      when '1SA'
        @ordinal = 9
        @name = '1 Samuel'
      when '2SA'
        @ordinal = 10
        @name = '2 Samuel'
      when '1KI'
        @ordinal = 11
        @name = '1 Kings'
      when '2KI'
        @ordinal = 12
        @name = '2 Kings'
      when '1CH'
        @ordinal = 13
        @name = '1 Chronicles'
      when '2CH'
        @ordinal = 14
        @name = '2 Chronicles'
      when 'EZR'
        @ordinal = 15
        @name = 'Ezra'
      when 'NEH'
        @ordinal = 16
        @name = 'Nehemiah'
      when 'EST'
        @ordinal = 17
        @name = 'Esther'
      when 'JOB'
        @ordinal = 18
        @name = 'Job'
      when 'PSA'
        @ordinal = 19
        @name = 'Psalms'
      when 'PRO'
        @ordinal = 20
        @name = 'Proverbs'
      when 'ECC'
        @ordinal = 21
        @name = 'Ecclesiastes'
      when 'SNG'
        @ordinal = 22
        @name = 'Song of Solomon'
      when 'ISA'
        @ordinal = 23
        @name = 'Isaiah'
      when 'JER'
        @ordinal = 24
        @name = 'Jeremiah'
      when 'LAM'
        @ordinal = 25
        @name = 'Lamentations'
      when 'EZK'
        @ordinal = 26
        @name = 'Ezekiel'
      when 'DAN'
        @ordinal = 27
        @name = 'Daniel'
      when 'HOS'
        @ordinal = 28
        @name = 'Hosea'
      when 'JOL'
        @ordinal = 29
        @name = 'Joel'
      when 'AMO'
        @ordinal = 30
        @name = 'Amos'
      when 'OBA'
        @ordinal = 31
        @name = 'Obadiah'
      when 'JON'
        @ordinal = 32
        @name = 'Jonah'
      when 'MIC'
        @ordinal = 33
        @name = 'Micah'
      when 'NAM'
        @ordinal = 34
        @name = 'Nahum'
      when 'HAB'
        @ordinal = 35
        @name = 'Habakkuk'
      when 'ZEP'
        @ordinal = 36
        @name = 'Zephaniah'
      when 'HAG'
        @ordinal = 37
        @name = 'Haggai'
      when 'ZEC'
        @ordinal = 38
        @name = 'Zechariah'
      when 'MAL'
        @ordinal = 39
        @name = 'Malachi'
      when 'MAT'
        @ordinal = 40
        @name = 'Matthew'
      when 'MRK'
        @ordinal = 41
        @name = 'Mark'
      when 'LUK'
        @ordinal = 42
        @name = 'Luke'
      when 'JHN'
        @ordinal = 43
        @name = 'John'
      when 'ACT'
        @ordinal = 44
        @name = 'Acts'
      when 'ROM'
        @ordinal = 45
        @name = 'Romans'
      when '1CO'
        @ordinal = 46
        @name = '1 Corinthians'
      when '2CO'
        @ordinal = 47
        @name = '2 Corinthians'
      when 'GAL'
        @ordinal = 48
        @name = 'Galatians'
      when 'EPH'
        @ordinal = 49
        @name = 'Ephesians'
      when 'PHP'
        @ordinal = 50
        @name = 'Philippians'
      when 'COL'
        @ordinal = 51
        @name = 'Colossians'
      when '1TH'
        @ordinal = 52
        @name = '1 Thessalonians'
      when '2TH'
        @ordinal = 53
        @name = '2 Thessalonians'
      when '1TI'
        @ordinal = 54
        @name = '1 Timothy'
      when '2TI'
        @ordinal = 55
        @name = '2 Timothy'
      when 'TIT'
        @ordinal = 56
        @name = 'Titus'
      when 'PHM'
        @ordinal = 57
        @name = 'Philemon'
      when 'HEB'
        @ordinal = 58
        @name = 'Hebrews'
      when 'JAS'
        @ordinal = 59
        @name = 'James'
      when '1PE'
        @ordinal = 60
        @name = '1 Peter'
      when '2PE'
        @ordinal = 61
        @name = '2 Peter'
      when '1JN'
        @ordinal = 62
        @name = '1 John'
      when '2JN'
        @ordinal = 63
        @name = '2 John'
      when '3JN'
        @ordinal = 64
        @name = '3 John'
      when 'JUD'
        @ordinal = 65
        @name = 'Jude'
      when 'REV'
        @ordinal = 66
        @name = 'Revelation'
      else
        return nil
      end

      return UsxParser::Book.new(code: code, ordinal: @ordinal, name: @name)
    end
  end
end