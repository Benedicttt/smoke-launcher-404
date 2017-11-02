When /^Select type tournament on activate$/ do
  sleep 1
  DRIVER.execute_script("$(\"span:contains('Activate')\").click()")
  sleep 1
end
