module FormatterSan
  class Formatter
    attr_accessor :input, :options
    
    def initialize(input, options={})
      @input = input
      @options = {
        :as => :simple
      }.merge(options)
    end
    
    def format
      case options[:as]
      when :simple
        FormatterSan::Formatters::Simple.format(@input)
      when :textile
        FormatterSan::Formatters::Textile.format(@input)
      else
        raise ArgumentError, "Unknown formatter: `#{options[:as]}'"
      end
    end
  end
end