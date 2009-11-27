require File.dirname(__FILE__) + '/spec_helper'

require File.dirname(__FILE__) + "/../lib/full_names.rb"

describe FullNames do

  it "should return false if not passed a String" do
    result = FullNames.parse(123)
    result.should be_false
  end

  it "should parse 'John' into first" do
    result = FullNames.parse("John")
    result[:first_name].should == "John"
  end
  
  it "should parse 'John Doe' into first and last" do
    result = FullNames.parse("John Doe")
    result[:first_name].should == "John"
    result[:last_name].should == "Doe"
  end
  
  it "should parse 'Dr. John Doe' into title, first and last" do
    result = FullNames.parse("Dr. John Doe")
    result[:title].should == "Dr."
    result[:first_name].should == "John"
    result[:last_name].should == "Doe"
  end

  it "should parse 'Mr. Doe' into title and last" do
    result = FullNames.parse("Mr. Doe")
    result[:title].should == "Mr."
    result[:last_name].should == "Doe"
  end

  it "should parse 'Mr Doe' into title and last" do
    result = FullNames.parse("Mr Doe")
    result[:title].should == "Mr"
    result[:last_name].should == "Doe"
  end

  it "should parse 'mr doe' into title and last" do
    result = FullNames.parse("mr doe")
    result[:title].should == "mr"
    result[:last_name].should == "doe"
  end
  
  it "should parse 'The Rt. Revd. John Doe' into title, first and last" do
    result = FullNames.parse("The Rt. Revd. John Doe")
    result[:title].should == "The Rt. Revd."
    result[:first_name].should == "John"
    result[:last_name].should == "Doe"
  end
  
  it "should parse 'Professor Sir John Doe' into title, first and last" do
    result = FullNames.parse("Professor Sir John Doe")
    result[:title].should == "Professor Sir"
    result[:first_name].should == "John"
    result[:last_name].should == "Doe"
  end
  
  it "should parse 'John Frederick Doe' into title, first and last" do
    result = FullNames.parse("John Frederick Doe")
    result[:first_name].should == "John"
    result[:middle_name].should == "Frederick"
    result[:last_name].should == "Doe"
  end

  it "should parse 'John Frederick Nancy Doe' into title, first and last" do
    result = FullNames.parse("John Frederick Nancy Doe")
    result[:first_name].should == "John"
    result[:middle_name].should == "Frederick Nancy"
    result[:last_name].should == "Doe"
  end

  it "should parse 'John Frederick Nancy Doe' into title, first and last" do
    result = FullNames.parse("John Frederick Nancy Doe")
    result[:first_name].should == "John"
    result[:middle_name].should == "Frederick Nancy"
    result[:last_name].should == "Doe"
  end
  
  it "should parse 'The Right Reverend and Right Honourable the Lord Bishop of London Richard John Carew Chartres' into title, first and last" do
    result = FullNames.parse("The Right Reverend and Right Honourable the Lord Bishop of London Richard John Carew Chartres")
    result[:title].should == "The Right Reverend and Right Honourable the Lord Bishop of London"
    result[:first_name].should == "Richard"
    result[:middle_name].should == "John Carew"
    result[:last_name].should == "Chartres"
  end
  

  
end