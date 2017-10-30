Given /^Add promo forms registartions$/ do
  DRIVER.get CommonSetting[:url_partner] + "promo/new"
  sleep 1
  DRIVER.find_element(:css, "#promo-tree > ul > li:nth-child(5) > span").click
  sleep 0.5
  DRIVER.find_element(:css, "a[data-widget='reg']").click
  sleep 0.5
  DRIVER.find_element(:css, ".widget-subaccount").send_keys("reg_sub_ac")
  widget_code = DRIVER.find_element(:css, ".widget-code").text
  File.open("./public/registration.html", "w") do |f|
    f.puts Time.now.to_s
    f.puts widget_code.sub(/binomo.com/, "#{ENV['stage']}.binomo.com").sub(/src/, "id=reg src")
  end
  File.open("./public/registration.html", "a") do |f|
    f.puts widget_code.sub(/binomo.com/, "#{ENV['stage']}.binomo.com").sub(/registration/, "registration_new").sub(/src/, "id=reg-new src")
  end
end
