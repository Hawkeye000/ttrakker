require "ttrakker/version"

module Ttrakker

  ROOT = 'http://www.amtrak.com'

  STATUS_FORM = {id:'ff_status_form', train:'wdf_trainNumber',
                   origin:'wdf_origin', destination:'wdf_destination',
                   sort_by:'wdf_SortBy' }
  STATUS_NEEDS = [[:origin, :destination], [:train, :origin], [:train, :destination]]

  def get_root
    agent = Mechanize.new
    page = agent.get(ROOT)
  end

  def options_good?(options={})
    STATUS_NEEDS.any? { |keys| (keys - options.keys).empty? }
  end

  def status_query(options={})
    agent = Mechanize.new
    page = get_root
    status_form = page.form(STATUS_FORM[:id])

    options.each do |key, value|
      status_form.send(STATUS_FORM[key], value)
    end

    agent.submit(status_form)
  end

end
