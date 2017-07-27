
module Server
  class SmokeBinomo
    attr_accessor :smoke_binomo, :count_features, :yopmail, :sleep_retried,
                  :count_cashier, :count_cashier_dep, :bonus_dep,

                  :count_payouts, :count_payouts_sum,
                  :count_deals, :count_deals_sum, :between, :turbo, :binary,

                  :count_pay_approve, :count_pay_reject,
                  :count_comments, :count_tickets,

                  :thread, :geo, :clear_cache, :proxy_http,
                  :proxy_server, :plus_rspec, :clear_cache

    def initialize(params)
      @thr = []
      @params = params
      params.each { |key, value| public_send("#{key}=", value) }
    end

    def get_link
      JSON.parse(@params.to_json).map { |key, value| key == "count_features" ? value.to_s : "#{key}=#{value.to_s}" }.join(" ")
    end

    def message(ws)
      if smoke_binomo == true
        thread.to_i.times do
          @thr << Thread.new { puts "Clear cache".yellow; system "rake tmp:cache:clear"; puts "Cache clear done".yellow} if clear_cache == "true"
          @thr << Thread.new { puts; puts get_link.yellow; puts; system get_link; ws.send("Test completed")}
          @thr << Thread.new do
            if plus_rspec == "true"
              puts "\nRun RSpec autotests staging\n".green
              system "stage=#{stage}. rspec"
              puts "The tests are complete. Result from the top".green
            end
          end
        end
      end
    end

  end
end
