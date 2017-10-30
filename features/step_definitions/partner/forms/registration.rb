Given /^Open registration forms$/ do
  DRIVER.manage.delete_all_cookies
  sleep 1
  DRIVER.get "http://#{ip_address = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address}:3001/registration.html"
  sleep 1
end
