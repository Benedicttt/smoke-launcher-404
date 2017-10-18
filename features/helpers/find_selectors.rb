def find_and_click_selectors(selector, text, driver)
  js_script = <<JSS
    Array.from(document.querySelectorAll('#{selector}')).find(el => el.textContent === '#{text}').click();
JSS

  driver.execute_script(js_script)
end
