Given /^Delete all tournaments$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 1
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  DRIVER.get CommonSetting[:url_page_crm] + "tournaments"
  sleep 1
  begin
    $i = 0
    $num = 200
    while $i < $num do
      DRIVER.find_elements(:css, ".btn-primary")[$i].click
      sleep 1
      DRIVER.find_element(:css, ".btn-danger").click
      print u
      $i += 1
      sleep 1
    end
  rescue
    puts "Delete ALL Tournaments"
  end
end
