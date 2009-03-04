require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatter" do
  it "should hold its input" do
    formatter = FormatterSan::Formatter.new('input')
    formatter.input.should == 'input'
  end
end
