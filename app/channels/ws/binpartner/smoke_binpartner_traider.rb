require "./features/helpers/decor"

module Server
  class SmokeBinpartnerTraider
    attr_accessor :smoke_binpartner_traider, :count_features,
                  :yopmail, :sleep_retried, :refcode, :tariff,

                  :count_cashier, :count_cashier_dep, :bonus_dep,
                  :count_payouts, :count_payouts_sum,
                  :count_deals, :count_deals_sum, :between, :turbo, :binary,
                  :count_pay_approve,

                  :thread, :geo, :clear_cache, :proxy_http,
                  :proxy_server, :plus_rspec, :clear_cache, :refcode, :ip_address, :param_headless

    def initialize(params)
      @params = params

      params.each { |key, value| public_send("#{key}=", value) }
    end

    def get_link
      JSON.parse(@params.to_json).map { |key, value| key == "count_features" ? value.to_s : "#{key}=#{value.to_s}" }.join(" ")
    end

    def message
      thread.to_i.times do
        if clear_cache == "true"
          puts "Clear cache".yellow
          system "rake tmp:cache:clear"
          system "rm -rf tmp"
          puts "Cache clear done".yellow
        end
        puts
        puts get_link.yellow
        puts;
        send_broadcast "smoke_binomo", "Run Smoke test Binpartner-traider"
        system get_link
        send_broadcast "smoke_binomo", "Done Smoke test Binpartner-traider"

      end
    end

  end
end
