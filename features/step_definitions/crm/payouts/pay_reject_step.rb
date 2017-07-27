Given /^Visit the page for payments application rejection$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")
end

When /^Rejection of an application and Application is rejected$/ do
  PaymentReject.run
end
