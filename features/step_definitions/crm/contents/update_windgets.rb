Given /^Update windgets$/ do
  authorization_by_crm(DRIVER)
  sleep 1
  begin
    DRIVER.get(CommonSetting[:url_page_crm] + "/widgets/1/edit")

    DRIVER.find_element(:id, "widget_name").clear
    DRIVER.find_element(:id, "widget_name").send_keys("Widget cashier #{Time.now}")
    DRIVER.find_element(:id, "widget_date_from").clear
    DRIVER.find_element(:id, "widget_date_from").send_keys(Time.now)
    DRIVER.find_element(:id, "widget_date_to").clear
    DRIVER.find_element(:id, "widget_date_to").send_keys(Time.now.strftime("#{Time.now.day + 1}.%m.%Y %H:%M:%S"))
    banner = File.absolute_path('./app/assets/images/banner_cashier.jpg')

    %i[en ru id ms es th vn cn pt tr pl ro me kr in ua].each_with_index do |locale, num|
      DRIVER.find_element(:id, "widget_data_banner_#{locale}").send_keys(banner)
      DRIVER.find_element(:id, "widget_data_url_#{locale}").clear
      DRIVER.find_element(:id, "widget_data_url_#{locale}").send_keys("/#{locale}")
    end
    DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
    DRIVER.find_elements(:css, "span.text")[0].click

    DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[2].click
    DRIVER.find_element(:css, ".bs-select-all").click
    DRIVER.find_elements(:css, ".btn-primary")[1].click


    sleep 1
    DRIVER.get(CommonSetting[:url_page_crm] + "/widgets/2/edit")

    DRIVER.find_element(:id, "widget_name").clear
    DRIVER.find_element(:id, "widget_name").send_keys("Widget cashier #{Time.now}")
    DRIVER.find_element(:id, "widget_date_from").clear
    DRIVER.find_element(:id, "widget_date_from").send_keys(Time.now)
    DRIVER.find_element(:id, "widget_date_to").clear
    DRIVER.find_element(:id, "widget_date_to").send_keys(Time.now.strftime("#{Time.now.day + 1}.%m.%Y %H:%M:%S"))
    banner = File.absolute_path('./app/assets/images/banner_trading.png')

    %i[en ru id ms es th vn cn pt tr pl ro me kr in ua].each_with_index do |locale, num|
      DRIVER.find_element(:id, "widget_data_banner_#{locale}").send_keys(banner)
      DRIVER.find_element(:id, "widget_data_url_#{locale}").clear
      DRIVER.find_element(:id, "widget_data_url_#{locale}").send_keys("/#{locale}")
    end
    DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
    DRIVER.find_elements(:css, "span.text")[0].click

    DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[2].click
    DRIVER.find_element(:css, ".bs-select-all").click
    DRIVER.find_elements(:css, ".btn-primary")[1].click
  rescue
    puts_danger "Widget's not fount in CRM"
  end
end
