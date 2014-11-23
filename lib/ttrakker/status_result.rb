require 'ttrakker'

class StatusResult

  def initialize(mech_status_result)

    @route_num = Ttrakker.route_num(mech_status_result)
    @route_name = Ttrakker.route_name(mech_status_result)
    @origin = Ttrakker.origin(mech_status_result)
    @destination = Ttrakker.destination(mech_status_result)
    @scheduled_dep = Ttrakker.scheduled_dep(mech_status_result)
    @scheduled_arr = Ttrakker.scheduled_arr(mech_status_result)
    @act_est_dep = Ttrakker.act_est_dep(mech_status_result)
    @act_est_arr = Ttrakker.act_est_arr(mech_status_result)

  end

  attr_reader :route_num, :route_name, :origin, :destination,
              :scheduled_dep, :scheduled_arr, :act_est_dep, :act_est_arr

end
