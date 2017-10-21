require 'selenium-webdriver'
require 'rspec/expectations'
require 'rubygems'
require 'headless'

include RSpec::Matchers

def setup
  headless = Headless.new
  headless.start
  @driver = Selenium::WebDriver.for :chrome
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://the-internet.herokuapp.com'
  expect(@driver.title).to eql 'The Internet'
  @driver.save_screenshot 'headless.png'
end
