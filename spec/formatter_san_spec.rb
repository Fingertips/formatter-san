require File.expand_path('../spec_helper', __FILE__)

class Person < ActiveRecord::Base
  formats :description
end

describe "Model with a formatted attributes" do
  before do
    @person = Person.new
  end
  
  it "should have a formatted accessor" do
    @person.should.respond_to(:formatted_description)
  end
  
  it "should return the formatted version of and attribute through the formatted accessor" do
    @person.description = "I'm a programmer"
    @person.formatted_description.should == "<p>I&#8217;m a programmer</p>"
  end
end

describe "FormatterSan" do
  it "should default to simple formatting" do
    FormatterSan::Formatters::Simple.should.receive(:format).with('input')
    FormatterSan.format('input')
  end
  
  it "should format simple" do
    FormatterSan::Formatters::Simple.should.receive(:format).with('input')
    FormatterSan.format('input', :as => :simple)
  end
  
  it "should format textile" do
    FormatterSan::Formatters::Textile.should.receive(:format).with('input')
    FormatterSan.format('input', :as => :textile)
  end
  
  it "should raise an exception when invoked with a nonexistant formatter" do
    lambda {
      FormatterSan.format('input', :as => :unknown)
    }.should.raise(ArgumentError)
  end
end
