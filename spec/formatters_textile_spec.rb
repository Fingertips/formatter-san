require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatters::Textile" do
  it "should function properly" do
    FormatterSan::Formatters::Textile.format('"Google":google.com').should == '<p><a href="google.com">Google</a></p>'
  end
end