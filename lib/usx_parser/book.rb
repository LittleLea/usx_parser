module UsxParser
  class Book
    attr_accessor :code, :ordinal, :name, :categories

    def initialize(code: nil, ordinal: nil, name: nil, categories: nil)
      self.code = code
      self.ordinal = ordinal
      self.name = name
      self.categories = categories
    end

    def self.find_by_code(code)
      return nil if code.nil?

      case code.upcase
      when 'GEN'
        @ordinal = 1
        @name = 'Genesis'
        @categories = [:canonical]
      when 'EXO'
        @ordinal = 2
        @name = 'Exodus'
        @categories = [:canonical]
      when 'LEV'
        @ordinal = 3
        @name = 'Leviticus'
        @categories = [:canonical]
      when 'NUM'
        @ordinal = 4
        @name = 'Numbers'
        @categories = [:canonical]
      when 'DEU'
        @ordinal = 5
        @name = 'Deuteronomy'
        @categories = [:canonical]
      when 'JOS'
        @ordinal = 6
        @name = 'Joshua'
        @categories = [:canonical]
      when 'JDG'
        @ordinal = 7
        @name = 'Judges'
        @categories = [:canonical]
      when 'RUT'
        @ordinal = 8
        @name = 'Ruth'
        @categories = [:canonical]
      when '1SA'
        @ordinal = 9
        @name = '1 Samuel'
        @categories = [:canonical]
      when '2SA'
        @ordinal = 10
        @name = '2 Samuel'
        @categories = [:canonical]
      when '1KI'
        @ordinal = 11
        @name = '1 Kings'
        @categories = [:canonical]
      when '2KI'
        @ordinal = 12
        @name = '2 Kings'
        @categories = [:canonical]
      when '1CH'
        @ordinal = 13
        @name = '1 Chronicles'
        @categories = [:canonical]
      when '2CH'
        @ordinal = 14
        @name = '2 Chronicles'
        @categories = [:canonical]
      when 'EZR'
        @ordinal = 15
        @name = 'Ezra'
        @categories = [:canonical]
      when 'NEH'
        @ordinal = 16
        @name = 'Nehemiah'
        @categories = [:canonical]
      when 'EST'
        @ordinal = 17
        @name = 'Esther'
        @categories = [:canonical]
      when 'JOB'
        @ordinal = 18
        @name = 'Job'
        @categories = [:canonical]
      when 'PSA'
        @ordinal = 19
        @name = 'Psalms'
        @categories = [:canonical]
      when 'PRO'
        @ordinal = 20
        @name = 'Proverbs'
        @categories = [:canonical]
      when 'ECC'
        @ordinal = 21
        @name = 'Ecclesiastes'
        @categories = [:canonical]
      when 'SNG'
        @ordinal = 22
        @name = 'Song of Solomon'
        @categories = [:canonical]
      when 'ISA'
        @ordinal = 23
        @name = 'Isaiah'
        @categories = [:canonical]
      when 'JER'
        @ordinal = 24
        @name = 'Jeremiah'
        @categories = [:canonical]
      when 'LAM'
        @ordinal = 25
        @name = 'Lamentations'
        @categories = [:canonical]
      when 'EZK'
        @ordinal = 26
        @name = 'Ezekiel'
        @categories = [:canonical]
      when 'DAN'
        @ordinal = 27
        @name = 'Daniel'
        @categories = [:canonical]
      when 'HOS'
        @ordinal = 28
        @name = 'Hosea'
        @categories = [:canonical]
      when 'JOL'
        @ordinal = 29
        @name = 'Joel'
        @categories = [:canonical]
      when 'AMO'
        @ordinal = 30
        @name = 'Amos'
        @categories = [:canonical]
      when 'OBA'
        @ordinal = 31
        @name = 'Obadiah'
        @categories = [:canonical]
      when 'JON'
        @ordinal = 32
        @name = 'Jonah'
        @categories = [:canonical]
      when 'MIC'
        @ordinal = 33
        @name = 'Micah'
        @categories = [:canonical]
      when 'NAM'
        @ordinal = 34
        @name = 'Nahum'
        @categories = [:canonical]
      when 'HAB'
        @ordinal = 35
        @name = 'Habakkuk'
        @categories = [:canonical]
      when 'ZEP'
        @ordinal = 36
        @name = 'Zephaniah'
        @categories = [:canonical]
      when 'HAG'
        @ordinal = 37
        @name = 'Haggai'
        @categories = [:canonical]
      when 'ZEC'
        @ordinal = 38
        @name = 'Zechariah'
        @categories = [:canonical]
      when 'MAL'
        @ordinal = 39
        @name = 'Malachi'
        @categories = [:canonical]
      when 'MAT'
        @ordinal = 40
        @name = 'Matthew'
        @categories = [:canonical]
      when 'MRK'
        @ordinal = 41
        @name = 'Mark'
        @categories = [:canonical]
      when 'LUK'
        @ordinal = 42
        @name = 'Luke'
        @categories = [:canonical]
      when 'JHN'
        @ordinal = 43
        @name = 'John'
        @categories = [:canonical]
      when 'ACT'
        @ordinal = 44
        @name = 'Acts'
        @categories = [:canonical]
      when 'ROM'
        @ordinal = 45
        @name = 'Romans'
        @categories = [:canonical]
      when '1CO'
        @ordinal = 46
        @name = '1 Corinthians'
        @categories = [:canonical]
      when '2CO'
        @ordinal = 47
        @name = '2 Corinthians'
        @categories = [:canonical]
      when 'GAL'
        @ordinal = 48
        @name = 'Galatians'
        @categories = [:canonical]
      when 'EPH'
        @ordinal = 49
        @name = 'Ephesians'
        @categories = [:canonical]
      when 'PHP'
        @ordinal = 50
        @name = 'Philippians'
        @categories = [:canonical]
      when 'COL'
        @ordinal = 51
        @name = 'Colossians'
        @categories = [:canonical]
      when '1TH'
        @ordinal = 52
        @name = '1 Thessalonians'
        @categories = [:canonical]
      when '2TH'
        @ordinal = 53
        @name = '2 Thessalonians'
        @categories = [:canonical]
      when '1TI'
        @ordinal = 54
        @name = '1 Timothy'
        @categories = [:canonical]
      when '2TI'
        @ordinal = 55
        @name = '2 Timothy'
        @categories = [:canonical]
      when 'TIT'
        @ordinal = 56
        @name = 'Titus'
        @categories = [:canonical]
      when 'PHM'
        @ordinal = 57
        @name = 'Philemon'
        @categories = [:canonical]
      when 'HEB'
        @ordinal = 58
        @name = 'Hebrews'
        @categories = [:canonical]
      when 'JAS'
        @ordinal = 59
        @name = 'James'
        @categories = [:canonical]
      when '1PE'
        @ordinal = 60
        @name = '1 Peter'
        @categories = [:canonical]
      when '2PE'
        @ordinal = 61
        @name = '2 Peter'
        @categories = [:canonical]
      when '1JN'
        @ordinal = 62
        @name = '1 John'
        @categories = [:canonical]
      when '2JN'
        @ordinal = 63
        @name = '2 John'
        @categories = [:canonical]
      when '3JN'
        @ordinal = 64
        @name = '3 John'
        @categories = [:canonical]
      when 'JUD'
        @ordinal = 65
        @name = 'Jude'
        @categories = [:canonical]
      when 'REV'
        @ordinal = 66
        @name = 'Revelation'
        @categories = [:canonical]
      when 'TOB'
        @name = 'Tobit'
        @categories = [:deuterocanonical, :apocryphal]
      when 'JDT'
        @name = 'Judith'
        @categories = [:deuterocanonical, :apocryphal]
      when 'ESG'
        @name = 'Esther (Greek)'
        @categories = [:deuterocanonical, :apocryphal]
      when 'WIS'
        @name = 'Wisdom'
        @categories = [:deuterocanonical, :apocryphal]
      when 'SIR'
        @name = 'Ecclesiasticus'
        @categories = [:deuterocanonical, :apocryphal]
      when 'BAR'
        @name = 'Baruch'
        @categories = [:deuterocanonical, :apocryphal]
      when 'S3Y'
        @name = 'Song of the Three'
        @categories = [:deuterocanonical, :apocryphal]
      when 'SUS'
        @name = 'Susanna'
        @categories = [:deuterocanonical, :apocryphal]
      when 'BEL'
        @name = 'Bel and the Dragon'
        @categories = [:deuterocanonical, :apocryphal]
      when '1MA'
        @name = '1 Maccabees'
        @categories = [:deuterocanonical, :apocryphal]
      when '2MA'
        @name = '2 Maccabees'
        @categories = [:deuterocanonical, :apocryphal]
      when '1ES'
        @name = '1 Esdras'
        @categories = [:apocryphal]
      when '2ES'
        @name = '2 Esdras'
        @categories = [:apocryphal]
      when 'MAN'
        @name = 'Manasseh'
        @categories = [:apocryphal]
      when 'LJE'
        @name = 'Letter of Jeremiah'
        @categories = [:deuterocanonical, :apocryphal]
      else
        return nil
      end

      return UsxParser::Book.new(code: code, ordinal: @ordinal, name: @name, categories: @categories)
    end
  end
end
