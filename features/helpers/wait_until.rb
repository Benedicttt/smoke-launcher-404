def wait_until(seconds, find_elem, name_elem)
  print_result = -> {puts_danger "Not find #{find_elem} from #{name_elem}"}
  retried_process(1, 1, print_result) do
    wait = Selenium::WebDriver::Wait.new(:timeout => seconds.to_i) # seconds
    element = wait.until do
      DRIVER.find_element(find_elem.to_sym => name_elem.to_s)
    end
  end
end
