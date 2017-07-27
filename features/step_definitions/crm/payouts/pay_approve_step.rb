Given /^Visit the page for payments confirmation$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")
end

When /^At the request of the payments and Payment committed$/ do
  PaymentsApprove.run(:"555555...4444")
  PaymentsApprove.run(:"400000...0002")
  PaymentsApprove.run(:"422345...0026")
end
