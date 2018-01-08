When /^Make a deals asset GOL\/OTC and lose bet$/ do
    sleep 3
    # $deals.find_elements(:css, ".dropdown-caret")[2].click
    $deals.find_element(:css, "div.b-unit-dropdown-balance").click
    sleep 1
    find_and_click_selectors('span', 'FOR/HEIGHT', $deals)
    sleep 5

    ENV['count_deals_sum'].to_i.times { sleep 0.1; $deals.find_elements(:css, ".btn-control-sm")[0].click}
    $deals.find_elements(:css, ".btn-control-sm")[1].click

    ENV['count_deals'].to_i.times  do |i|
      sleep ENV['between'].to_i
      $deals.execute_script("document.querySelector('.btn-call').click()")
    end
end
