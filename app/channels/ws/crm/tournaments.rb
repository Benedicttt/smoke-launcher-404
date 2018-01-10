require "./features/helpers/decor"

module Server
  class Tournaments
    attr_accessor :smoke_tournaments, :count_features,
                  :yopmail, :sleep_retried,

                  :count_cashier, :count_cashier_dep, :bonus_dep,
                  :count_payouts, :count_payouts_sum,
                  :count_deals, :count_deals_sum, :between, :turbo, :binary,
                  :count_pay_approve, :data_from, :data_to,

                  :thread, :geo, :clear_cache, :proxy_http,
                  :proxy_server, :ip_address, :param_headless, :count_tournaments

    def initialize(params)
      @params = params

      params.each { |key, value| public_send("#{key}=", value) }
    end

    def get_link
      JSON.parse(@params.to_json).map do |key, value|
        key == "count_features" ? value.to_s : "#{key}=#{value.to_s}"
      end.join(" ")

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
        send_broadcast "smoke_binomo", "Run Smoke test Tournament"
        system get_link
        send_broadcast "smoke_binomo", "Done Smoke test Tournament"
      end
    end

  end
end
