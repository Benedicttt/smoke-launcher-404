Given /^Activate all templates$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 2
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  sleep 1
  DRIVER.get(CommonSetting[:url_page_crm] + "/email_templates")

  all_href = DRIVER.find_elements(:css, ".content a")
  @arr = []
  all_href.map { |link| @arr << link.attribute('href') }
  # 306 templates

  @arr.map do |arr_elem|
    DRIVER.get arr_elem.to_s
    sleep 0.5
    DRIVER.find_element(:id, "email_template_subject").clear
    DRIVER.find_element(:id, "email_template_subject").send_keys("#{DRIVER.find_elements(:css, "tr td")[1].text} #{DRIVER.find_elements(:css, "td")[3].text}")
    sleep 0.1
    DRIVER.find_element(:id, "email_template_content").clear
    sleep 0.1
    DRIVER.find_element(:id, "email_template_content").send_keys(DRIVER.find_element(:css, ".dl-horizontal").text)
    sleep 0.1
    DRIVER.execute_script("$('input#email_template_active').prop('checked', true)")
    sleep 0.1
    DRIVER.find_element(:css, "input.btn-primary").click
    sleep 1
  end
end
