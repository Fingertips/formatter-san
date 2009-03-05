gem 'RedCloth', '> 4.0'
require 'RedCloth'

require 'formatter_san/rubypants'
require 'formatter_san/formatter'
require 'formatter_san/formatters/simple'
require 'formatter_san/formatters/textile'

module FormatterSan
  # Adds accessors named formatted_attribute_name to the model which return the string value of the attribute formatted.
  #
  # Options:
  # * <tt>:as</tt>: Specify the formatter to use (default: :simple)
  #
  # Examples:
  #   formats :call_out, :body
  #   formats :read_more, :as => :textile
  def formats(*arguments)
    options = arguments.last.kind_of?(Hash) ? arguments.pop : {}
    arguments.each do |attribute|
      define_method "formatted_#{attribute}" do
        FormatterSan::Formatter.new(send(attribute), options).format
      end
    end
  end
end