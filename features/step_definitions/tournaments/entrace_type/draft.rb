When /^Select type tournament on draft$/ do
  DRIVER.execute_script("$(\"span:contains('Draft')\").click()")
end
