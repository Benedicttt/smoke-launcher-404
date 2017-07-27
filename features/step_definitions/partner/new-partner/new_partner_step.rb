Given /^Visit to page partner.com$/ do
  @@ref_code_bonus = self.class.class_variable_defined?(:@@ref_code_bonus) ? @@ref_code_bonus : ""

  begin
    Partner.pluck(:refcode, :stage_number).each { |r| $ref = r[0] if r[1] == "#{ENV['stage']}"}
  rescue
    $ref = "deafult"
  end
  DRIVER.get(CommonSetting[:url_partner] + CommonSetting[:locale] + "?ref=#{$ref}")
  sleep 2
end

When /^Partner registration$/ do
  DRIVER.find_element(:css, '.btn.btn-header-registration.btn-gold-full.popup-action').click
  sleep 1
  DRIVER.find_element(:css, "input[name='email']").send_keys(EMAIL)
  sleep 0.1
  DRIVER.find_element(:css, "input[name='password']").send_keys(CommonSetting[:user_test]['pass_partner'])
  DRIVER.find_element(:css, "input[name='password_confirmation']").send_keys(CommonSetting[:user_test]['pass_partner'])
  sleep 0.1
  DRIVER.find_element(:css, "input[name='promo_code']").send_keys(@@ref_code_bonus) unless ENV['stage'].to_s == "locale"
  sleep 0.1
end

Then /^Registered partner$/ do
  DRIVER.find_element(:css, "input[type=submit]").click
  sleep 2
end
