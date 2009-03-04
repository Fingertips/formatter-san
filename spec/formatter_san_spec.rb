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
end
