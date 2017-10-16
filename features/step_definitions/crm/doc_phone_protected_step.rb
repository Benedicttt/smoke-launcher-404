Given /^Doc protected to$/ do
end

Then /^Protected set done$/ do
  $pool.post do
    doc = Driver::Set.session(:document_verifed)
    doc.get(CommonSetting[:url_page_crm])
    sleep 1
    retried_process(3, 3) do
      doc.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      doc.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      doc.find_element(:css, 'input[value="Sign in"]').click
    end
    sleep 1

    id = User.where(stage_number: ENV['stage']).last.id
    doc.get(CommonSetting[:url_user_crm] + "/#{id}")
    sleep 1
    date_now = Time.now
    date_to = Time.now.strftime("#{date_now.day + 1}.%m.%Y %H:%M:%S")
    doc.find_element(:id, 'user_docs_protected_to').clear
    doc.find_element(:id, 'user_docs_protected_to').send_keys(date_to)
    sleep 1
    doc.find_elements(:css, '.btn-primary')[0].click
    puts_success "Set date document protected to #{doc.execute_script("return $('#user_docs_protected_to').val()")}"
    sleep 5
    que "update users set document_verifed = true, updated_at = '#{Time.now}' where id = '#{id}';"
    doc.quit
  end
end

Given /^Phone verified find$/ do
  $pool.post do
    phone = Driver::Set.session(:phone)

    phone.get(CommonSetting[:url_page_crm])
    sleep 1
    retried_process(3, 3) do
      phone.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      phone.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      phone.find_element(:css, 'input[value="Sign in"]').click
    end
    sleep 1

    id = User.where(stage_number: ENV['stage']).last.id
    phone.get(CommonSetting[:url_user_crm] + "/#{id}")
    sleep 1
    phone.execute_script("$('#user_phone_verified').prop('checked', true)")

    sleep 1
    phone.find_elements(:css, '.btn-primary')[0].click
    sleep 1
    puts_success "Phone verifed true" if phone.execute_script("return $('#user_phone_verified').prop('checked', true)")
    que "update users set phone_verifed = 'true', updated_at = '#{Time.now}' where id = '#{id}';"
    phone.quit
  end
end

Then /^Phone verifed$/ do

end
