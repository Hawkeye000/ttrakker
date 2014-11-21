require 'spec_helper'
describe Ttrakker do

  describe "get_root" do

    it "should respond with 200" do
      page = Ttrakker.get_root
      expect(page.code).to eq("200")
    end

  end

  describe "status_query" do

    before do
      @options = {origin:"NLC", destination:"NYP"}
    end

    it "should respond with 200" do
      expect(status_query(@options).code).to eq("200")
    end

    it "should contain at least one status result" do
      expect(status_query(@options).search(".status_result")).to_not be_empty
    end

    it "should not return status if the parameters are bad" do
      @options[:origin] = nil
      expect(status_query(@options).search(".status_result")).to be_empty
    end

  end

  describe "options_good?" do

    it "should return true if the options match any STATUS_NEEDS" do
      @options = {}
      Ttrakker::STATUS_NEEDS[0].each { |key| @options[key] = nil }
      expect(options_good?(@options)).to be_truthy
    end

  end

end
