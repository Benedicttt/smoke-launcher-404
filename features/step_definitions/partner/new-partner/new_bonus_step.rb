Given /^Receive a ref-code$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/bonuses/new"
  sleep 1
  DRIVER.find_element(:id, "bonus_title").send_keys("Promo code #{Time.now.to_s}")
  print "<br><br>
         #{link_report_id("https://#{ENV['stage']}-adm.binpartner.com/bonuses/",
         "https://#{ENV['stage']}-adm.binpartner.com/bonuses/")}<br><br>"

  DRIVER.find_element(:id, "bonus_lifetime").clear
  DRIVER.find_element(:id, "bonus_rate").clear
  sleep 0.1
  DRIVER.find_element(:id, "bonus_lifetime").send_keys("60")
  DRIVER.find_element(:id, "bonus_rate").send_keys("70")
  DRIVER.execute_script("$('#bonus_active').click()")
  sleep 1
  DRIVER.find_element(:css, "input[type='submit']").click
  sleep 1

  DRIVER.get CommonSetting[:url_adm_partner] + "/bonuses"
  @@ref_code_bonus = DRIVER.find_element(:xpath, "//*[@id=\"content\"]/div[3]/div/table/tbody/tr[1]/td[3]").text
end

Given /^Delete all promo-code$/ do
  PartnersSmoke::Admin.authorize
  DRIVER.get CommonSetting[:url_adm_partner] + "/bonuses"
  sleep 1
  begin
    while DRIVER.find_element(:css, ".btn-info").displayed? == true
      DRIVER.find_elements(:css, ".btn-info")[0].click
      sleep 0.5
      DRIVER.find_element(:css, ".btn-danger").click
      print u
    end
  rescue
    puts_danger "Delete ALL promo_code"
  end
end
