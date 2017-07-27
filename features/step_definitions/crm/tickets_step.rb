Given /^Visit page tickets$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/tickets")
  sleep 2
end

When /^Enter a comment on your tickets$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  print_result = -> {puts_danger "Nofind tickets CRM for #{id}"}
  retried_process(1, 1, print_result) do
    DRIVER.find_element(:css, "#main-content > div > table > tbody > tr.error > td:nth-child(2) > a").click
    sleep 1
    ENV['count_tickets'].to_i.times do |q|
      q += 1
      comment = " Asked"
      DRIVER.find_element(:id, "text").send_keys(q.to_s + comment.to_s)
      DRIVER.find_element(:css, "input[type=\"submit\"]").click
    end
    puts_info "Created #{ENV['cout_tickets']}"
  end
end

Then /^Response to a request issued$/ do
end
