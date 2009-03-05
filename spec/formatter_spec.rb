require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatter" do
  it "should hold its input" do
    formatter = FormatterSan::Formatter.new('input')
    formatter.input.should == 'input'
  end
  
  it "should hold its options" do
    formatter = FormatterSan::Formatter.new('input', :as => :simple)
    formatter.options.should == { :as => :simple }
  end
  
  it "should default to the simple formatter" do
    formatter = FormatterSan::Formatter.new('')
    formatter.options[:as].should == :simple
  end
  
  it "should format simple strings" do
    FormatterSan::Formatter.new('input').format.should == '<p>input</p>'
  end
  
  it "should not break when formatting supported formats" do
    [:simple, :textile].each do |as|
      lambda {
        FormatterSan::Formatter.new('input', :as => as).format
      }.should.not.raise
    end
  end
  
  it "should raise an exception when invoked with a nonexistant formatter" do
    formatter = FormatterSan::Formatter.new('input', :as => :unknown)
    lambda {
      formatter.format
    }.should.raise(ArgumentError)
  end
end
