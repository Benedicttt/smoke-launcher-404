When /^Enter a comments on your profile page$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}")
end
Then /^Comments inserted$/ do
  ENV['comments'].to_i.times do |i|
    sleep 1
    comment = " comment"
    DRIVER.find_element(:id, "comment_body").send_keys(i.to_s + comment.to_s)
    DRIVER.find_elements(:css, ".btn.btn-primary")[1].click
    sleep 0.7
  end
  puts_info "Comments  #{ENV['comments']}"
end
