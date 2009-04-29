require 'spec_helper'

describe "Forecast Measurement" do
  
  describe "when initialized" do
    
    before(:each) do
      @forecast = Barometer::ForecastMeasurement.new
    end
    
    it "responds to date" do
      @forecast.date.should be_nil
    end
    
    it "responds to icon" do
      @forecast.icon.should be_nil
    end
    
    it "responds to condition" do
      @forecast.condition.should be_nil
    end
    
    it "responds to low" do
      @forecast.low.should be_nil
    end
    
    it "responds to high" do
      @forecast.high.should be_nil
    end
    
    it "responds to pop" do
      @forecast.pop.should be_nil
    end
    
  end
  
  describe "when writing data" do
    
    before(:each) do
      @forecast = Barometer::ForecastMeasurement.new
    end
    
    it "only accepts Date for date" do
      invalid_data = 1
      invalid_data.class.should_not == Date
      lambda { @forecast.date = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = Date.new
      valid_data.class.should == Date
      lambda { @forecast.date = valid_data }.should_not raise_error(ArgumentError)
    end
    
    it "only accepts String for icon" do
      invalid_data = 1
      invalid_data.class.should_not == String
      lambda { @forecast.icon = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = "valid"
      valid_data.class.should == String
      lambda { @forecast.icon = valid_data }.should_not raise_error(ArgumentError)
    end
    
    it "only accepts String for condition" do
      invalid_data = 1
      invalid_data.class.should_not == String
      lambda { @forecast.condition = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = "valid"
      valid_data.class.should == String
      lambda { @forecast.condition = valid_data }.should_not raise_error(ArgumentError)
    end
    
    it "only accepts Barometer::Temperature for high" do
      invalid_data = 1
      invalid_data.class.should_not == Barometer::Temperature
      lambda { @forecast.high = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = Barometer::Temperature.new
      valid_data.class.should == Barometer::Temperature
      lambda { @forecast.high = valid_data }.should_not raise_error(ArgumentError)
    end
    
    it "only accepts Barometer::Temperature for low" do
      invalid_data = 1
      invalid_data.class.should_not == Barometer::Temperature
      lambda { @forecast.low = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = Barometer::Temperature.new
      valid_data.class.should == Barometer::Temperature
      lambda { @forecast.low = valid_data }.should_not raise_error(ArgumentError)
    end
    
    it "only accepts Fixnum for pop" do
      invalid_data = "test"
      invalid_data.class.should_not == Fixnum
      lambda { @forecast.pop = invalid_data }.should raise_error(ArgumentError)
      
      valid_data = 50
      valid_data.class.should == Fixnum
      lambda { @forecast.pop = valid_data }.should_not raise_error(ArgumentError)
    end
    
  end
  
  describe "method missing" do
    
    before(:each) do
      @forecast = Barometer::ForecastMeasurement.new
    end
    
    it "responds to method + ?" do
      valid_method = "pop"
      @forecast.respond_to?(valid_method).should be_true
      lambda { @forecast.send(valid_method + "?") }.should_not raise_error(NoMethodError)
    end
    
    it "ignores non_method + ?" do
      invalid_method = "humid"
      @forecast.respond_to?(invalid_method).should be_false
      lambda { @forecast.send(invalid_method + "?") }.should raise_error(NoMethodError)
    end
    
    it "returns true if set" do
      @forecast.pop = 10
      @forecast.pop.should_not be_nil
      @forecast.pop?.should be_true
    end
    
    it "returns false if not set" do
      @forecast.pop.should be_nil
      @forecast.pop?.should be_false
    end
    
  end
  
end