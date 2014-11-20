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

  end

end
