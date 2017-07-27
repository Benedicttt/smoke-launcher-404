require 'rubygems'
require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require 'websocket'
require 'socket'
require 'selenium-webdriver'


Given /^Pid process$/ do

  if ENV['driver'] == "firefox"
    DRIVER = Selenium::WebDriver.for ENV['driver'].to_sym

  elsif ENV['driver'] == "chrome"
    options =  Selenium::WebDriver::Chrome::Options.new(args: [ "disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}"])
    DRIVER = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
    DRIVER.manage.window.resize_to(1200, 700)
    DRIVER.manage.timeouts.implicit_wait = 10

  elsif ENV['driver'] == "safari"
    client = Selenium::WebDriver::Remote::Http::Default.new
    DRIVER = Selenium::WebDriver.for :safari, :http_client => client
    DRIVER.manage.timeouts.implicit_wait = 10

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

Given /^Pid process Smoke Binomo$/ do
  print "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\"
          integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">"

  File.open("./features/temporary/pids/pid_smoke", "a"){ |f| f.puts("#{Process.pid}")}
  puts Process.pid.to_s
  puts "Staging: #{ENV['stage']}"
end

Given /^Pid process deploy branch$/ do
  puts
  File.open("./features/temporary/pids/pid_deploy", "a"){ |f| f.puts("#{Process.pid}")}
  puts Process.pid.to_s
end

Given /^Run join thread's$/ do
  $pool.shutdown && $pool.wait_for_termination
  puts_danger "Last threads? #{$pool.running?}"
end
