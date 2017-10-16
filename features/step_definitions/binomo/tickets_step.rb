Given /^Created ticket$/ do
  $tickets = Driver::Set.session(:tickets)

  $tickets.get(CommonSetting[:app_host]  + CommonSetting[:locale])
  $tickets.manage.add_cookie(name: "asset.daily", value: "FAKE")
  $tickets.manage.add_cookie(name: "agreed", value: "1")

  id = User.where(stage_number: ENV['stage']).last.id
  $tickets.execute_script("localStorage.setItem(\"#{id}.real.welcome_bonus\", \"1\")" )
  $tickets.execute_script("localStorage.setItem(\"#{id}.demo.welcome_bonus\", \"1\")")
end

When /^Data ticket$/ do
  add_cookies_to_page($tickets)
  $tickets.get(CommonSetting[:app_host]  + CommonSetting[:locale])
  $tickets.manage.window.resize_to(1200, 700)
  sleep 3

    print_result = -> {puts "Error open form (retried)"; return; puts}
    retried_process(3, 3, print_result) do
      sleep 1
      $tickets.execute_script("$('.b-unit-ask-question').scope().showTicketQuestion()")
      sleep 1
      $tickets.execute_script("$('span.unit.ng-binding.ng-scope').click()")
      sleep 1
      $tickets.find_element(:css, "input[name='title']").send_keys("Question title")
      sleep 1
      $tickets.find_element(:css, "textarea[name='text']").send_keys("Question textarea")
      sleep 1
      $tickets.execute_script("$('.btn-primary:first').click()")
      sleep 5
      puts_info "Tickets created"
    end

end

Then /^Ticket created$/ do
  $tickets.execute_script("$('.btn-primary')[1].click()")
  $tickets.quit
end
