When /^Select type tournament on draft$/ do
  DRIVER.execute_script("$(\"span:contains('draft')\").click()")
end
