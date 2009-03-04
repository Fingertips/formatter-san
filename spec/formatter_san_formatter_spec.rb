require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatter" do
  it "should hold its input" do
    formatter = FormatterSan::Formatter.new('input')
    formatter.input.should == 'input'
  end
  
  it "should format simple strings" do
    [
      ['word', '<p>word</p>']
    ].each do |input, expected|
      FormatterSan::Formatter.new(input).format.should == expected
    end
  end
end
