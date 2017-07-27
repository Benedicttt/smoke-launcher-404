Given /^Add logos$/ do
  PartnersSmoke::Admin.authorize

  %i[tr en ru id ms es th vn cn pt md me kr].each_with_index do |locale, num|
    DRIVER.get CommonSetting[:url_adm_partner] + "logotypes/new"
    banner = File.absolute_path('./app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "banner_file").send_keys(banner)
    DRIVER.find_element(:id, "banner_lang").send_keys("#{locale}")
    DRIVER.execute_script("$('.checkbox').click()")
    DRIVER.execute_script("$('.btn-primary').click()")
  end
  print "<br><br>#{link_report_id(DRIVER.current_url, DRIVER.current_url)}<br><br>"
end
