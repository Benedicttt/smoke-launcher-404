Given(/^Visit all page binpartner, status code page\(adm and platform\) \- !!! no authorized$/) do
  DRIVER.get CommonSetting[:url_partner] + CommonSetting[:locale]
  link = File.read("./features/step_definitions/status_code/pages/no_auth_partner_platform_200")
  link.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:url_partner] + link.to_s)
  end
end
