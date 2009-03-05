gem 'RedCloth', '> 4.0'
require 'RedCloth'

require 'formatter_san/rubypants'
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
        FormatterSan.format(send(attribute), options)
      end
    end
  end
  
  # Format the input.
  #
  # Options:
  # * <tt>:as</tt>: Specify the formatter to use (default: :simple)
  #
  # Examples:
  #   FormatterSan.format("Nobody _really_ knows anything.", :as => :textile)
  def self.format(input, options={})
    options = { :as => :simple }.merge(options)
    case options[:as]
    when :simple
      FormatterSan::Formatters::Simple.format(input)
    when :textile
      FormatterSan::Formatters::Textile.format(input)
    else
      raise ArgumentError, "Unknown formatter: `#{options[:as]}'"
    end
  end
end