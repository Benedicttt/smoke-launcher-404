When /^Make a deals asset GOL\/OTC and win bet$/ do
    sleep 3
    $deals.find_elements(:css, ".dropdown-caret")[2].click
    sleep 1
    find_and_click_selectors('span', 'FOR/HEIGHT', $deals)
    sleep 5

    ENV['count_deals_sum'].to_i.times { sleep 0.1; $deals.find_elements(:css, ".btn-control-sm")[0].click}
    $deals.find_elements(:css, ".btn-control-sm")[1].click

    if "#{ENV['turbo']}" == "true"
      $deals.find_element(:xpath, "//*[@id=\"eur-graphs\"]/div/div/aside[2]/div/form/div[2]/div/div/ul/li[1]/a")
    end

    if "#{ENV['binary']}" == "true"
      $deals.find_element(:xpath, "//*[@id=\"eur-graphs\"]/div/div/aside[2]/div/form/div[2]/div/div/ul/li[7]/a")
    end


    ENV['count_deals'].to_i.times  do |i|
      sleep ENV['between'].to_i
      $deals.execute_script("document.querySelector('.btn-put').click()")
    end
end
