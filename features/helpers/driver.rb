module Driver
  class Set
    def self.session(type)

      case type
      when :pay, :wire, :card, :card_approve, :pay_approve, :wire_approve, :document_verifed, :phone, :tickets, :deals, :confirmed

        if ENV['driver'] == "firefox"
          driver = Selenium::WebDriver.for ENV['driver'].to_sym
        elsif ENV['driver'] == "chrome"
          options = Selenium::WebDriver::Chrome::Options.new(args: [ "disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}" ])
          driver = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
        end

      end

    end
  end
end


$pool = Concurrent::RubyThreadPoolExecutor.new(
     min_threads: 3,
     max_threads: 3,
     max_queue: 10
   )
