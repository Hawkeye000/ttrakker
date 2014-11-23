require 'spec_helper'

describe StatusResult do

  before { @sr = StatusResult.new(status_results(origin:"NLC", destination:"NYP").first) }

  subject { @sr }

  it { should respond_to :origin }
  it { should respond_to :destination }
  it { should respond_to :act_est_dep }
  it { should respond_to :act_est_arr }
  it { should respond_to :scheduled_dep }
  it { should respond_to :scheduled_arr }
  it { should respond_to :route_num }
  it { should respond_to :route_name }

end
