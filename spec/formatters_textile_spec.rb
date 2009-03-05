require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatters::Textile" do
  it "should function properly" do
    FormatterSan::Formatters::Textile.format('"Goole":google.com').should == '<p><a href="google.com">Goole</a></p>'
  end
end