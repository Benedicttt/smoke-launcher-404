Given(/^Visit all page binpartner, status code page\(adm and platform\) \- !!! authorized$/) do
  DRIVER.get CommonSetting[:url_adm_partner]
  DRIVER.manage.add_cookie name: "_binpartner_session", value: "cFZVUE9GaWxjQkx4WmFPbloyTWFtQmxiUjUvU3A0SGlLd3B1b1l2emVhNUxVc0xMM2xxY1hnVG9JQXZHdENiYXk4VFdUVGpHOXBnWHB3NlZTUW01Wm1tdUthUlhvSS9Bb3NiMXZjQzAyVzc1NkdjR240am5heWlSZDVncVdGTDN3b1RpWXU3SzVjZnFmbUhXT2VZVnBBPT0tLWZUcW9WaTdhbm1acGFBY29mQUY5anc9PQ%3D%3D--00364fe74a10997faca97b5e8922bd9c86cbb9f2"
  DRIVER.manage.add_cookie name: "user_id", value: "Mg%3D%3D--93f1ebbc01a1356c110cf0c09775ce51783e886c"
  DRIVER.navigate.refresh
  sleep 1

  link = File.read("./features/step_definitions/status_code/pages/adm_partner_200")
  link.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:url_adm_partner] + link.to_s)
  end


  DRIVER.get CommonSetting[:url_partner] + CommonSetting[:locale]
  add_cookies_to_page_partner(DRIVER)
  DRIVER.navigate.refresh
  sleep 1

  link = File.read("./features/step_definitions/status_code/pages/auth_partner_200")
  link.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:url_partner] + link.to_s)
  end
end
