When /^Select type tournament on demand$/ do
  DRIVER.execute_script("$(\"span:contains('on_demand')\").click()")
end
