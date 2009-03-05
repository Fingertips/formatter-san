require 'formatter_san/rubypants'
require 'formatter_san/formatter'

module FormatterSan
  # Adds accessors named formatted_attribute_name to the model which return the string value of the attribute formatted.
  def formats(*attributes)
    attributes.each do |attribute|
      define_method "formatted_#{attribute}" do
        FormatterSan::Formatter.new(send(attribute)).format
      end
    end
  end
end