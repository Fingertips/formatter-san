module FormatterSan
  module Formatters
    module Textile
      def self.format(input)
        RedCloth.new(input).to_html
      end
    end
  end
end