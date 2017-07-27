Given /^Visit page profile User$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}")
end
When /^Select manager$/ do
  DRIVER.execute_script("$('#edit_user > div.control-group.select.optional.user_manager_id > div > div > div > ul > li:nth-child(3)').click().trigger('change')");
  sleep 0.2
  DRIVER.find_element(:css, "input[value='Update User']").click
end
Then /^Manager selected$/ do
  sleep 2
  puts_info DRIVER.find_elements(:css, ".pull-left")[1].text
end
