require 'rubygems'
require 'appium_lib'
#
# APP_PATH = './TestApp.app'
#
# desired_caps = {
#   caps:       {
#     platformName:  'iOS',
#     platformVersion: '10.2',
#     deviceName:    'iPhone 6',
#     app:           APP_PATH,
#     automationName: "XCUITest"
#   },
#   appium_lib: {
#     sauce_username:   nil, # don't run on Sauce
#     sauce_access_key: nil
#   }
# }
#
# # Start the driver
# Appium::Driver.new(desired_caps).start_driver
#
# module Calculator
#   module IOS
#     # Add all the Appium library methods to Test to make
#     # calling them look nicer.
#     Appium.promote_singleton_appium_methods Calculator
#
#     # Add two numbers
#     values       = [rand(10), rand(10)]
#     expected_sum = values.reduce(&:+)
#
#     # Find every textfield.
#     elements     = textfields
#
#     elements.each_with_index do |element, index|
#       element.type values[index]
#     end
#
#     # Click the first button
#     button(1).click
#
#     # Get the first static text field, then get its text
#     actual_sum = first_text.text
#     raise unless actual_sum == (expected_sum.to_s)
#
#     # Alerts are visible
#     button('show alert').click
#     find_element :class_name, 'UIAAlert' # Elements can be found by :class_name
#
#     # wait for alert to show
#     wait { text 'this alert is so cool' }
#
#     # Or by find
#     find_exact('Cancel').click
#
#     # Waits until alert doesn't exist
#     wait_true { !exists { tag('UIAAlert') } }
#
#     # Alerts can be switched into
#     wait { button('show alert').click } # Get a button by its text
#     alert         = driver.switch_to.alert # Get the text of the current alert, using
#     # the Selenium::WebDriver directly
#     alerting_text = alert.text
#     raise Exception unless alerting_text.include? 'Cool title'
#     alert_accept # Accept the current alert
#
#     # Window Size is easy to get
#     sizes = window_size
#     raise Exception unless sizes.height == 667
#     raise Exception unless sizes.width == 375
#
#     # Quit when you're done!
#     driver_quit
#     puts 'Tests Succeeded!'
#   end
# end



# Set the environment variables:
#   SAUCE_USERNAME = your-sauce-username
#   SAUCE_ACCESS_KEY = your-sauce-key

desired_caps = {
      caps:       {
        # appiumVersion:    '1.4.16',
        platformName:     'Android',
        # platformVersion:  '4.4',
        browserName:       '',
        deviceName:       'Samsung Galaxy S4 Emulator',
        app:              '../../Downloads/app-beta-debug.app',
        name:             'Ruby Appium Sauce example'
      }
    }

driver = Appium::Driver.new(desired_caps)
driver.start_driver

# Test Actions here...

driver.driver_quit
