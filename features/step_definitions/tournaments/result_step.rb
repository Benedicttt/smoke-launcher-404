Then /^Result$/ do
  DRIVER.find_element(:css, '.button').click
  sleep 1

  uri = URI "#{DRIVER.current_url}"
  puts_info "#{link_report_id(DRIVER.current_url.to_s, "CRM")}"
    %i[en ru id ms es th vn cn pt tr pl me ro kr].each_with_index do |locale, num|
      print link_report_id("#{CommonSetting[:app_host] + "#{locale}" + uri.path.to_s.sub(/edit/, '')}", "#{locale.upcase}")
    end
    print "<br><br>"
    $url_tournaments = DRIVER.current_url.sub(/#{ENV['stage']}-crm/, "#{ENV['stage']}").sub(/edit/, '')
    id_tournament = URI.parse(DRIVER.current_url).path.gsub(/[a-zA-Z\/]/, '')

    TournamentsIds.create(stage: ENV['stage'] + ".", tournament_id: id_tournament)
end

When /^Participate$/ do
  DRIVER.get $url_tournaments
  sleep 3

  add_cookies_to_page(DRIVER)
  DRIVER.manage.add_cookie(name: "asset.daily", value: "FAKE")
  DRIVER.execute_script("localStorage.setItem(\"#{User.last.id}.real.welcome_bonus\", \"1\")" )
  DRIVER.execute_script("localStorage.setItem(\"#{User.last.id}.demo.welcome_bonus\", \"1\")")
  DRIVER.find_elements(:css, '.btn-primary')[2].click
  sleep 1
  DRIVER.find_elements(:css, '.btn-primary')[0].click
  sleep 1
  DRIVER.find_elements(:css, '.btn-primary')[0].click if DRIVER.find_elements(:css, '.btn-primary')[0] == true
  sleep 1
  DRIVER.navigate.refresh
  puts_success "#{link_report_id("#{$url_tournaments}", "BINOMO")}"
end
