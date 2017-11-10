Given /^Fixed$/ do
  DRIVER.execute_script("$(\"span:contains('Fixed')\").click()")
  quality = 5
  quality.times { DRIVER.find_element(:css, "div.btn-success.add-prize").click }
  sleep 1

  (1..quality.to_i).each do |num|
    begin
      $list_currency.count.times do |i|
        DRIVER.find_element(:css, "input[name='tournament[prizes_attributes][#{num}][amounts_attributes][#{i}][value]']").send_keys("#{100/quality}")
      end
    rescue
    end
  end
end

Given /^Percentage$/ do
  DRIVER.execute_script("$(\"span:contains('Percentage')\").click()")
  quality = 5
  quality.times { DRIVER.find_element(:css, "div.btn-success.add-prize").click }
  sleep 1

  (1..quality.to_i).each do |num|
    DRIVER.find_element(:css, "input[name='tournament[prizes_attributes][#{num}][percent]']").send_keys("#{100/quality}")
  end
end
