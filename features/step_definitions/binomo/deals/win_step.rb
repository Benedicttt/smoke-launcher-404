When /^Make a deals asset GOL\/OTC and win bet$/ do
    $deals.execute_script("$(\".asset:contains('FOR/HEIGHT'):first\").click()")
    sleep 5

    ENV['count_deals_sum'].to_i.times { sleep 0.1; $deals.find_elements(:css, "button.control.plus")[0].click}
    $deals.find_element(:css, "button.control.minus").click

    if "#{ENV['turbo']}" == "true"
      $deals.execute_script("$(\"a:contains('#{Time.now.hour}:#{Time.now.min} + 1')\").click().trigger('change')")
    end

    if "#{ENV['binary']}" == "true"
      $deals.execute_script("$(\"a:contains(':45')\").click().trigger('change')")
    end

    ENV['count_deals'].to_i.times  do |i|
      sleep ENV['between'].to_i
      $deals.execute_script("$('.btn-put').click()")
    end
end
