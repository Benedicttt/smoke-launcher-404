require 'rubygems'
require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require 'websocket'
require 'socket'
require 'selenium-webdriver'
require 'cucumber'

Given /^Pid process$/ do
  if ENV['driver'] == "firefox"
    DRIVER = Selenium::WebDriver.for ENV['driver'].to_sym

  elsif ENV['driver'] == "chrome"
    # "headless",
    options =  Selenium::WebDriver::Chrome::Options.new(args: [ "--start-maximized", "--disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}"])
    DRIVER = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
    DRIVER.manage.timeouts.implicit_wait = 5

    if ENV['test_xvfb'].to_s == "true"
      $headless = Headless.new
      $headless.start
    end

    DRIVER.manage.window.resize_to(1600, 1020)

  elsif ENV['driver'] == "safari"
    client = Selenium::WebDriver::Remote::Http::Default.new
    DRIVER = Selenium::WebDriver.for :safari, :http_client => client
    DRIVER.manage.timeouts.implicit_wait = 5

  end

  buttons_include
  File.open("./features/temporary/pids/pid_cucumber", "a"){ |f| f.puts("#{Process.pid}")}

  puts_info "#{Process.pid.to_s} Driver #{ENV['driver'].to_s.upcase} #{ENV['stage'].to_s.upcase}"
  EMAIL = "#{CommonSetting[:email_name]}#{SecureRandom.hex(8)}@yopmail.com"

  if ENV['stage'] == "s1"
    ENV['staging'] = ENV['stage'].to_s.gsub(/s/, 'staging').sub(/1/, '')
  else
    ENV['staging'] = ENV['stage'].to_s.gsub(/s/, 'staging')
  end
end

Given /^Pid process deploy branch$/ do
  puts
  File.open("./features/temporary/pids/pid_deploy", "a"){ |f| f.puts("#{Process.pid}")}
  puts Process.pid.to_s
end

Given /^Pool ranning\?$/ do
  $pool.shutdown && $pool.wait_for_termination
  puts_danger "Last threads? #{$pool.running?}"
  $headless.destroy if ENV['test_xvfb'].to_s == "true"
end
