require File.dirname(__FILE__) + '/spec_helper'

describe ValidatesTimeliness::AttributeMethods do
 
  describe "for Time columns" do
    before do
      Person.define_read_method_for_time_zone_conversion(:birth_date_and_time)
      Person.define_write_method_for_time_zone_conversion(:birth_date_and_time)
      @person = Person.new
    end
    
    it "should define attribute read method for column" do
      @person.respond_to?(:birth_date_and_time).should be_true
    end

    it "should define attribute write method for column" do
      @person.respond_to?(:birth_date_and_time=).should be_true
    end

    it "should return string value for attribute_before_type_cast when written as string" do
      @person.birth_date_and_time = "1980-12-25 01:02:03"
      @person.birth_date_and_time_before_type_cast.should == "1980-12-25 01:02:03" 
    end
    
    it "should return Time object for attribute_before_type_cast when written as Time" do
      @person.birth_date_and_time = time = Time.mktime(1980, 12, 25, 1, 2, 3)
      @person.birth_date_and_time_before_type_cast.should == time
    end

    it "should return Time object using attribute read method when written with string" do
      @person.birth_date_and_time = "1980-12-25 01:02:03"
      @person.birth_date_and_time.should == Time.mktime(1980, 12, 25, 1, 2, 3)
    end
    
    it "should read stored time with correct timezone"
    
    it "should return nil when date is invalid"
  end  
  
  describe "for Date columns" do
    before do
      Person.define_read_method_for_time_zone_conversion(:birth_date)
      Person.define_write_method_for_time_zone_conversion(:birth_date)
      @person = Person.new
    end
    
    it "should define attribute read method for column" do
      @person.respond_to?(:birth_date).should be_true
    end

    it "should define attribute write method for column" do
      @person.respond_to?(:birth_date=).should be_true
    end

    it "should return string value for attribute_before_type_cast when written as string" do
      @person.birth_date = "1980-12-25"
      @person.birth_date_before_type_cast.should == "1980-12-25" 
    end
    
    it "should return Date object for attribute_before_type_cast when written as Date" do
      @person.birth_date = date = Date.new(1980, 12, 25)
      @person.birth_date_before_type_cast.should == date
    end

    it "should return Date object using attribute read method when written with string" do
      @person.birth_date = "1980-12-25"
      @person.birth_date.should == Date.new(1980, 12, 25)
    end
    
    it "should read stored time with correct timezone"
    
    it "should return nil when date is invalid"
  end  
 
end