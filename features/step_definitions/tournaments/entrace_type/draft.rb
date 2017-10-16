When /^Select type tournament on demand$/ do
  DRIVER.execute_script("$(\"span:contains('draft')\").click()")
end
