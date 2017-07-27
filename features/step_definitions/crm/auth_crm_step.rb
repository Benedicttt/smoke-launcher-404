Given /^Visit page CRM$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
end

When /^Authorization crm$/ do
  sleep 3
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end
end

Then /^Success$/ do
  # DRIVER.manage.all_cookies.each do |cookie|
  #   puts cookie[:name]
  #   puts cookie[:value]
  # end
  # File.open("./features/temporary/crm_cookies", "w") { |f| f.puts DRIVER.manage.all_cookies.to_json }
end
