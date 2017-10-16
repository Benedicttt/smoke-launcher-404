Given(/^Visit all page binomo, status code page \- !!! authorized$/) do
  sleep 1
  link = File.read("./features/step_definitions/status_code/pages/binomo_auth_200")
  link.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:app_host] + link.to_s)
  end
end
