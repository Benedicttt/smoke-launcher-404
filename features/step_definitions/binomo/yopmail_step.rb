
Given /^Mailers yopmail$/ do
end

When /^Input email and find link yopmail$/ do
  yopmail = Driver::Set.session(:confirmed)

  yopmail.get('http://www.yopmail.com/ru')
  yopmail.manage.window.resize_to(1200, 700)
  sleep 3
  yopmail.find_element(:id, "login").send_keys(User.where(stage_number: ENV['stage']).last.email)
  yopmail.find_element(:css, ".sbut").click
  sleep 3
  print_result = -> {puts_danger "No find link :("; return; puts}

  frame = yopmail.find_element :id, 'ifmail'
  yopmail.switch_to.frame frame
      retried_process(3, 3, print_result) do
        link = yopmail.find_element(:css, "#mailmillieu > div:nth-child(2)").text
        links = File.open("./features/temporary/yop_mail", 'w'){ |f| f.puts link }
        params_file = File.read("./features/temporary/yop_mail").split[0..20]
        link_activation = params_file.find {|x| x["activation_token"]}.to_s
        link_unsubcribe = params_file.find {|x| x["code"]}.to_s

        yopmail.get link_activation
        sleep 1
        print "<p>#{link_report_activation(link_activation.to_s)}#{link_report_unsubcribe(link_unsubcribe.to_s)}</p>"
      end
  result_confirmed_mail
  yopmail.quit
end

Then /^Visit to link yopmail$/ do
end
