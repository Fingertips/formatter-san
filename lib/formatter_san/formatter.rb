module FormatterSan
  # Formatter that makes it a bit easier to write formatted text using HTML
  class Formatter
    attr_accessor :input
    
    def initialize(input)
      @input = input
    end
  end
end