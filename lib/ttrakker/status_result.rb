require 'ttrakker'

class StatusResult

  attr_reader :route_num, :route_name, :origin, :destination,
              :scheduled_dep, :scheduled_arr, :act_est_dep, :act_est_arr

  def initialize(mech_status_result)
    return nil unless mech_status_result.class == Mechanize

    @route_num = route_num(mech_status_result)
    @route_name = route_name(mech_status_result)
    @origin = origin(mech_status_result)
    @destination = destination(mech_status_result)
    @scheduled_dep = scheduled_dep(mech_status_result)
    @scheduled_arr = scheduled_arr(mech_status_result)
    @act_est_dep = act_est_dep(mech_status_result)
    @act_est_arr = act_est_arr(mech_status_result)

  end

end
