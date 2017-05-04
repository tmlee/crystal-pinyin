require "./pinyin/*"
require "../data/pinyin_dict.cr"

module Pinyin
  PINYIN_DICT = PinyinDict::DATA
  INITIALS = %w{b p m f d t n l g k h j q x r zh ch sh z c s}
  PHONETIC_SYMBOLS = Phonetic::SYMBOL
  RE_PHONETIC_SYMBOLS = /[#{PHONETIC_SYMBOLS.keys.join("")}]/
  RE_TONE2 = /([aeoiuvnm])([0-4])/;

  Normal      = 0 # 普通风格，不带声调（默认风格）。如： zhong guo
  Tone        = 1 # 声调风格1，拼音声调在韵母第一个字母上。如： zhōng guó
  Tone2       = 2 # 声调风格2，即拼音声调在各个韵母之后，用数字 [1-4] 进行表示。如： zho1ng guo2
  Initials    = 3 # 声母风格，只返回各个拼音的声母部分。如： zh g

  # TODO: (To Be Implemented)
  # FirstLetter = 4 // 首字母风格，只返回拼音的首字母部分。如： z g
  # Finals      = 5 // 韵母风格，只返回各个拼音的韵母部分，不带声调。如： ong uo
  # FinalsTone  = 6 // 韵母风格1，带声调，声调在韵母第一个字母上。如： ōng uó
  # FinalsTone2 = 7 // 韵母风格2，带声调，声调在各个韵母之后，用数字 [1-4] 进行表示。如： o1ng uo2
  # FinalsTone3 = 9 // 韵母风格3，带声调，声调在各个拼音之后，用数字 [1-4] 进行表示。如： ong1 uo2

  def self.say(words, style, heteronym=nil)
    output = Array(Array(String)).new()
    words.each_char do |char|
      char_pinyins = self.single_pinyin(char.to_s)
      next unless char_pinyins
      char_pinyins = char_pinyins[0,1] unless heteronym
      output << self.stylize(char_pinyins, style)
    end
    output
  end

  protected def self.stylize(char_pinyins, style)
    char_pinyins.map_with_index do |char_pinyin, index|
      case style
      when Pinyin::Normal
        md = char_pinyin.match(Pinyin::RE_PHONETIC_SYMBOLS)
        char_pinyins[index] = char_pinyin.gsub Pinyin::RE_PHONETIC_SYMBOLS, Pinyin::PHONETIC_SYMBOLS[md[0]] if md
        md = Pinyin::RE_TONE2.match(char_pinyin).try(&.[1])
        char_pinyins[index] = char_pinyin.gsub Pinyin::RE_TONE2, md if md
      when Pinyin::Initials
        Pinyin::INITIALS.map do |initial|
          if char_pinyin.starts_with?(initial)
            char_pinyins[index] = initial
            break
          end
        end
      when Pinyin::Tone2
        md = char_pinyin.match(Pinyin::RE_PHONETIC_SYMBOLS)
        char_pinyins[index] = char_pinyin.gsub Pinyin::RE_PHONETIC_SYMBOLS, Pinyin::PHONETIC_SYMBOLS[md[0]] if md
      end      
    end
    char_pinyins
  end

  protected def self.single_pinyin(chinese_char)
    PINYIN_DICT[chinese_char].split(',') if PINYIN_DICT.has_key? chinese_char
  end
end
