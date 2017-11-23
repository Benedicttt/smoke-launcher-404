def find_angular_text(driver, css, vm_name)
  return driver.execute_script("return angular.element(document.querySelector('#{css}')).scope()." + "#{vm_name}")
end
