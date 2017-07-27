Given /^Delete all tournaments$/ do
  DRIVER.get CommonSetting[:url_page_crm] + "tournaments"
  sleep 1

  begin
    $i = 0
    $num = 200
    while $i < $num do
      DRIVER.find_elements(:css, ".btn-primary")[$i].click
      sleep 0.3
      DRIVER.find_element(:css, ".btn-danger").click
      print u
      $i += 1
    end
  rescue
    puts "Delete ALL Tournaments"
  end
end
