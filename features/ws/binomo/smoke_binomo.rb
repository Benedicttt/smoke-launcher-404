require "./features/helpers/decor"

module Server
  class SmokeBinomo
    attr_accessor :smoke_binomo, :count_features, :yopmail, :sleep_retried,
                  :count_cashier, :count_cashier_dep, :bonus_dep,

                  :count_payouts, :count_payouts_sum,
                  :count_deals, :count_deals_sum, :between, :turbo, :binary,

                  :count_pay_approve, :count_pay_reject,
                  :count_comments, :count_tickets,

                  :thread, :geo, :clear_cache, :proxy_http,
                  :proxy_server, :plus_rspec, :clear_cache, :ip_address

    def initialize(params)
      @params = params
      params.each { |key, value| public_send("#{key}=", value) }
    end

    def get_link
      JSON.parse(@params.to_json).map { |key, value| key == "count_features" ? value.to_s : "#{key}=#{value.to_s}" }.join(" ")
    end

    def message
      if clear_cache == "true"
        puts "Clear cache".yellow
        system "rake tmp:cache:clear"
        system "rm -rf tmp"
        puts "Cache clear done".yellow
      end

      puts
      puts get_link.yellow
      puts
      system "Xvfb :1 -screen 0 1920x1080x24 2>&1 >/dev/null & export DISPLAY=:1"
      system get_link

    end
  end
end
