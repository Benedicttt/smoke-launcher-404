When(/^Open list deals$/) do
  sleep 3
  $deals.find_elements(:css, ".dropdown-caret")[2].click
  sleep 3
  find_and_click_selectors('span', 'FOR/HEIGHT', $deals)
  sleep 2
  $deals.find_elements(:css, ".dropdown-caret")[2].click
  sleep 5
  @ratio = $deals.find_elements(:css, "span.ng-binding")[5].text
  @ratio.sub(/%/, "").to_s
  @sum_deal = ENV['count_deals_sum'].to_s
  sleep 1

  sleep 1
  $deals.find_elements(:css, "a.i-unit-icon-toggle.ng-isolate-scope")[0].click
  sleep 2

  begin
    if $deals.find_elements(:css, "div.total-count > div.result > span.currency-amount")[0].nil? == true
      puts_danger "No create deals"
    else
      @result = $deals.find_elements(:css, "div.total-count > div.result > span.currency-amount")[0].text
    end
  rescue NoMethodError
    puts_info "not found"
    puts raise
  end
end

Then(/^Rate by RIC equal percent sum win deal$/) do
  begin
    puts_success "#{@sum_deal.to_i + @ratio.to_i * 0.1 } => #{@result}"
  rescue
    puts_danger "not found"
  end
end
