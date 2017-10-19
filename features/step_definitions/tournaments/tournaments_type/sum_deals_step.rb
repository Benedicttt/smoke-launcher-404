When /^Created Tournament 'sum deals'$/ do
  DRIVER.execute_script("$(\"span:contains('sum_deals')\").click()")
  sleep 1
end
