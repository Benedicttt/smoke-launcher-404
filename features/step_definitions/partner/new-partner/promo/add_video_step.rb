Given /^Add video$/ do
  PartnersSmoke::Admin.authorize
  DRIVER.get CommonSetting[:url_adm_partner] + "videos/new"

  %i[tr en ru id ms es th vn cn pt md me kr].each_with_index do |locale, num|
    DRIVER.find_element(:id, "video_title_#{locale}").send_keys("#{Time.now} #{locale}")
    DRIVER.find_element(:id, "video_description_#{locale}").send_keys("#{locale}")
    DRIVER.find_element(:id, "video_url_#{locale}").send_keys("https://www.youtube.com/watch?v=x2YziwipYtU")
    DRIVER.execute_script("$('#video_type_id > option:nth-child(3)').selected()")
  end
  DRIVER.execute_script("$('.checkbox').click()")
  DRIVER.execute_script("$('.btn-primary').click()")
  print "<br><br>#{link_report_id(DRIVER.current_url, DRIVER.current_url)}<br><br>"
end
