Given /^Open registration forms$/ do
  DRIVER.manage.delete_all_cookies
  sleep 1
  DRIVER.get "file:///Users/benedict/Documents/smoke-binomo/features/step_definitions/partner/forms/registration.html"
  sleep 2
end
