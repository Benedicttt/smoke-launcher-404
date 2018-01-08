Given /^Checking all manager true$/ do
  DRIVER.execute_script("$(\"input[name='sales_managers[auto_assign][]']\").prop('checked', true)")
  sleep 0.5
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
