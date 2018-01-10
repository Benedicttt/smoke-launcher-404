require "./features/helpers/decor"

module Server
  class SmokeContentPage
    attr_accessor :smoke_content_pages, :count_features, :sleep_retried,
                  :thread, :geo, :clear_cache, :proxy_http,
                  :proxy_server, :clear_cache, :ip_address, :param_headless

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
      send_broadcast "content_page_channel", "Test data contents RUN, expected..."
      system get_link
      send_broadcast "content_page_channel", "Test data contents DONE"
    end
  end
end
