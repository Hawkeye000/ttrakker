require "ttrakker/version"

module Ttrakker

  @@root = 'http://www.amtrak.com'
  @@status_form_id = 'ff_status_form'
  @@status_form_train = 'wdf_trainNumber'
  @@status_form_origin = 'wdf_origin'
  @@status_form_destination = 'wdf_destination'
  @@status_form_sort_by = 'wdf_SortBy'

  @@status_form = {id:'ff_status_form', train:'wdf_trainNumber',
                   origin:'wdf_origin', destination:'wdf_destination',
                   sort_by:'wdf_SortBy' }

  def get_root
    agent = Mechanize.new
    page = agent.get(@@root)
  end

  def status_query(options={})
    agent = Mechanize.new
    page = get_root
    status_form = page.form(@@status_form[:id])

    options.each do |key, value|
      status_form.send(@@status_form[key], value)
    end

    agent.submit(status_form)
  end

end
