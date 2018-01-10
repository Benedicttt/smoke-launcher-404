require "./features/helpers/decor"

module Server
  class SmokeBinpartner
    attr_accessor :smoke_binpartner, :count_features, :thread, :clear_cache, :proxy_http, :proxy_server, :ip_address, :param_headless

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
        puts
        send_broadcast "smoke_binomo", "Run Smoke test Binpartner"
        system get_link
        send_broadcast "smoke_binomo", "Done Smoke test Binpartner"
      end
    end

  end
end
