Then /^The figures are not reset when you save$/ do

  DRIVER.find_element(:id, 'customer_skype').attribute('value') == "testing"
  DRIVER.find_element(:id, 'customer_email').attribute('value') == "#{@@email_partner}"
  DRIVER.find_element(:id, 'customer_refcode').attribute('value') == "#{@refcode}"
  DRIVER.find_element(:id, 'customer_phone').attribute('value') == "+79817657676"
  DRIVER.find_element(:id, 'customer_nickname').attribute('value') == "Aff#{@nick_r}"
  DRIVER.find_element(:id, 'customer_traffic_sources_other_list').attribute('value') ==  "#{CommonSetting[:url_adm_partner]}"
  DRIVER.find_element(:id, 'customer_wmz').attribute('value') == "Z#{@card_r}"

  puts_success "Tarrif 0 #{DRIVER.find_elements(:id, 'customer_tariff_active')[0].attribute('checked')}, Tarrif 1 #{DRIVER.find_elements(:id, 'customer_tariff_active')[1].attribute('checked')},
  Tarrif 2 #{DRIVER.find_elements(:id, 'customer_tariff_active')[2].attribute('checked')}, Tarrif 3 #{DRIVER.find_elements(:id, 'customer_tariff_active')[3].attribute('checked')},
  Tarrif 4 #{DRIVER.find_elements(:id, 'customer_tariff_active')[4].attribute('checked')}, Tarrif 5 #{DRIVER.find_elements(:id, 'customer_tariff_active')[5].attribute('checked')}"

   que "INSERT INTO partners (referall, skype, phone, nickname, card, tariff_first, tariff_last, cpa_first, cpa_last, cpl_soi, cpl_doi, bonuse_code, email, id, platform, stage_number, created_at, driver, updated_at, locale, refcode)
        values(
        '#{$ref}',
        '#{@skype}',
        '#{@phone}',
        '#{@nickname}',
        '#{@card}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[0].attribute('checked')}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[1].attribute('checked')}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[2].attribute('checked')}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[3].attribute('checked')}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[4].attribute('checked')}',
        '#{DRIVER.find_elements(:id, 'customer_tariff_active')[5].attribute('checked')}',
        '#{@ref_code_bonus}',
        '#{@@email_partner}',
        '#{@@id}',
        'binpartner',
        '#{ENV['stage']}',
        '#{Time.now}',
        '#{ENV['driver']}',
        '#{Time.now}',
        '#{ENV['locale']}',
        '#{@refcode}');"

  sleep 0.2
  @cookies_partner = DRIVER.manage.all_cookies.each_with_object({}) { |cookie, acc| acc[cookie[:name]] = cookie[:value] }

  Partner.find(@@id).update(branch: File.read("./features/temporary/binpartner_branch_#{ENV['staging']}").sub(/\n/, ''), cookies: @cookies_partner)

  puts_warning link_report_id("#{CommonSetting[:url_adm_partner]}/customers/#{Partner.last.id}/edit", " Email: #{DRIVER.execute_script("return $('#customer_email').val()")}")
  puts_warning link_report_id("#{CommonSetting[:url_adm_partner]}/stats/common?email=#{Partner.find("#{@@id}").email}", " Stats partner in adm: #{Partner.find("#{@@id}").email}")
  puts_info "Deal rate default #{DRIVER.execute_script("return $('#customer_deal_rate').val()")} %"
end
