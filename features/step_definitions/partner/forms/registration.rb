Given /^Open registration forms$/ do
  DRIVER.manage.delete_all_cookies
  DRIVER.navigate.back
  DRIVER.navigate.refresh
  DRIVER.get "file:///Users/benedict/Documents/smoke-binomo/features/step_definitions/partner/forms/registration.html"
  sleep 1
end
