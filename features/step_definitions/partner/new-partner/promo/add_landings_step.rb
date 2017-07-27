Given /^Add landings$/ do
  PartnersSmoke::Admin.authorize
  DRIVER.get CommonSetting[:url_adm_partner] + "landings/new"

  %i[tr en ru id ms es th vn cn pt  md me kr].each_with_index do |locale, num|
    image = File.absolute_path('./app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "landing_title_#{locale}").send_keys("#{Time.now} #{locale}")
    DRIVER.find_element(:id, "landing_description_#{locale}").send_keys("#{locale}")
    banner= File.absolute_path('./app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "landing_icon_#{locale}").send_keys(banner)
  end
    DRIVER.execute_script("$('.checkbox').click()")
    DRIVER.find_element(:id, "landing_url").send_keys("/l25")
    DRIVER.execute_script("$('.btn-primary').click()")
  print "<br><br>#{link_report_id(DRIVER.current_url, DRIVER.current_url)}<br><br>"
end
