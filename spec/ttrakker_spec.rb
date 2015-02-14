require 'spec_helper'
describe Ttrakker do

  describe "get_root" do

    it "should respond with 200" do
      VCR.use_cassette("get_root") do
        page = Ttrakker.get_root
        expect(page.code).to eq("200")
      end
    end

  end

  describe "status_query" do

    context "parameters are good" do
      before do
        @options = {origin:"NLC", destination:"NYP"}
        VCR.use_cassette("status_query") do
          @response = status_query(@options)
        end
      end

      it "should respond with 200" do
        expect(@response.code).to eq("200")
      end

      it "should contain at least one status result" do
        expect(@response.search(".status_result")).to_not be_empty
      end
    end

    context "parameters are bad" do
      it "should not return status" do
        @options = {origin:nil, destination:"NYP"}
        VCR.use_cassette("bad_status_query") do
          @response = status_query(@options)
        end
        expect(@response.search(".status_result")).to be_empty
      end
    end

  end

  describe "options_good?" do

    it "should return true if the options match any STATUS_NEEDS" do
      @options = {}
      Ttrakker::STATUS_NEEDS[0].each { |key| @options[key] = nil }
      expect(options_good?(@options)).to be_truthy
    end

  end

  describe "status_results" do

    before do |example|
      unless example.metadata[:skip_before]
        @options = {origin:"NLC", destination:"NYP"}
        VCR.use_cassette("status_results") do
          @results = status_results(@options)
        end
      end
    end

    it "should group results into pairs" do
      expect(@results.all? { |x| x.length == 2 }).to be_truthy
    end

    it "should have an arrival and departure in each pair" do
      expect(@results.all? { |x| x[0].search(".departs") && x[1].search(".arrives") }).to be_truthy
    end

    describe "route_num" do

      it "should return a number" do
        expect(@results.all? { |x| route_num(x) =~ /\A\d*\z/ }).to be_truthy
      end

    end

    describe "route_name" do

      it "should return a string", :skip_before do
        @options = {origin:"NYP", train:"2100"}
        VCR.use_cassette("status_result_route_name") do
          @results = status_results(@options)
        end
        expect(@results.all? { |x| route_name(x).to_s }).to be_truthy
      end

    end

    describe "origin" do

      it "should return the city set as origin" do
        expect(origin(@results.first) =~ /NLC/).to be_truthy
      end

      it "should not return the destination" do
        expect(origin(@results.first) =~ /NYP/).to be_falsey
      end

    end

    describe "destination" do

      it "should return the city set as destination" do
        expect(destination(@results.first) =~ /NYP/).to be_truthy
      end

      it "should not return the origin" do
        expect(destination(@results.first) =~ /NLC/).to be_falsey
      end

    end

    describe "scheduled_arr & scheduled_dep" do

      describe "scheduled_arr" do

        it "should return a DateTime object" do
          expect(scheduled_arr(@results.first)).to be_a(DateTime)
        end

      end

      describe "scheduled_dep" do

        it "should return a DateTime object" do
          expect(scheduled_dep(@results.first)).to be_a(DateTime)
        end

      end

      it "should have scheduled arrival after departure" do
        dep = scheduled_dep(@results.first)
        arr = scheduled_arr(@results.first)
        expect(dep).to be < arr
      end

    end

    describe "act_est_arr and act-ext_dep" do

      describe "act_est_arr" do

        it "should return a DateTime object" do
          expect(act_est_arr(@results.first)).to be_a(DateTime)
        end

      end

      describe "act_est_dep" do

        it "should return a DateTime object" do
          expect(act_est_dep(@results.first)).to be_a(DateTime)
        end

      end

      it "should have scheduled arrival after departure" do
        dep = act_est_dep(@results.first)
        arr = act_est_arr(@results.first)
        expect(dep).to be < arr
      end

    end

  end

end
