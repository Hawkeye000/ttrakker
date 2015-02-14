require 'spec_helper'

describe StatusResult do

  before do
    VCR.use_cassette("status_result_for_poro") do
      @sr_noko = status_results(origin:"NLC", destination:"NYP").first
      @sr = StatusResult.new(@sr_noko)
    end
  end

  subject { @sr }

  it { should respond_to :origin }
  it { should respond_to :destination }
  it { should respond_to :act_est_dep }
  it { should respond_to :act_est_arr }
  it { should respond_to :scheduled_dep }
  it { should respond_to :scheduled_arr }
  it { should respond_to :route_num }
  it { should respond_to :route_name }

  describe "setting parameters" do

    it "should have the same origin as the nokogiri result" do
      expect(@sr.origin).to eq(origin(@sr_noko))
    end

  end

end
