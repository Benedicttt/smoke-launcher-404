When(/^Open list deals$/) do
  sleep 3
  begin
    sleep 2
    $deals.find_element(:css, "div.b-unit-dropdown-balance").click
    sleep 1
    $deals.find_elements(:css, ".i-unit-account-type")[0].click
    sleep 3
    begin
      $deals.find_elements(:css, ".w-unit-account-mode-changed > button.btn-primary")[0].click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts_info "No found modal"
    end

    sleep 5
    find_and_click_selectors('span', 'FOR/HEIGHT', $deals)
    sleep 2

    @ratio = $deals.find_elements(:css, "span.ng-binding")[5].text
    @ratio.sub(/%/, "").to_s
    @sum_deal = ENV['count_deals_sum'].to_s
    sleep 3
    $deals.find_elements(:css, "a.i-unit-icon-toggle.ng-isolate-scope")[0].click
    sleep 2

    if $deals.find_elements(:css, "div.total-count > div.result > span.currency-amount")[0].nil? == true
      puts_danger "No create deals"
    else
      @result = $deals.find_elements(:css, "div.total-count > div.result > span.currency-amount")[0].text
    end
  rescue Selenium::WebDriver::Error::UnknownError
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
