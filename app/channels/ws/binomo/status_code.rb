require "./features/helpers/decor"

module Server
  class StatusCode
    attr_accessor :smoke_status_code, :count_features,
                  :thread, :clear_cache, :geo, :proxy_http,
                  :proxy_server, :response_http,
                  :not_response_http, :param_headless

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

        puts get_link.yellow
        puts;
        send_broadcast "smoke_binomo", "Run Smoke test Status code page"
        system get_link
        send_broadcast "smoke_binomo", "Done Smoke test Status code page"
      end

    end
  end
end
