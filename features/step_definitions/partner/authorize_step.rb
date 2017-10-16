Given /^Visit to page binpartner.com$/ do
  DRIVER.get CommonSetting[:url_partner] + "/"
  sleep 1
  DRIVER.manage.delete_all_cookies
  DRIVER.get CommonSetting[:url_partner] + "/"
  sleep 2
end

Then /^Add data form$/ do
  DRIVER.find_element(:css, "div[data-popup-target=\"sign-in\"]").click
  sleep 1
  DRIVER.find_elements(:css, "input[name=email]")[1].send_keys(Partner.where(stage_number: ENV['stage']).last.email)
  DRIVER.find_elements(:css, "input[name=password]")[1].send_keys(CommonSetting[:user_test]['pass_partner'])
end

Then /^Click button Sign in and Authorize to partner.com$/ do
  DRIVER.find_elements(:css, "input.btn-submit")[1].click
  sleep 2
end
