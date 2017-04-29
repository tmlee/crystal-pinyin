require "option_parser"

module Pinyin
  class CLI
    def run(options=ARGV)
      heteronym = false
      output_style = nil

      OptionParser.parse! do |parser|
        parser.banner = instruction
        parser.on("-h", "--heteronym", "output heteronym pinyins") { heteronym = true }
        parser.on("-s STYLE", "--style=STYLE", "pinyin styles") do |style|
          case style
          when "TONE2"
            output_style = Pinyin::Tone2
          else
            output_style = Pinyin::Tone
          end
        end
        parser.on("-h", "--help", "output usage information") do
          puts instruction
          exit 0
        end
      end

      if options.empty?
        puts instruction
        return 
      else
        words = options.first
        results = Pinyin.say(words, style: output_style, heteronym: heteronym)

        results = results.map do |chunk|
          chunk.join(',')
        end
        puts results.join(' ')
      end
    end

    def instruction
      <<-INSTRUCTION
        Usage: pinyin [options] 汉字,
        
        Options:

        -h, --help                   output usage information
        -V, --version                output the version number
        -s, --style <style>          pinyin styles: [NORMAL,TONE,TONE2]
        -h, --heteronym              output heteronym pinyins

      INSTRUCTION
    end
  end
end
