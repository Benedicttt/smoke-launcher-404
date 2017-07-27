module Server
  class SmokeBinpartner
    attr_accessor :smoke_binpartner, :count_features, :thread, :clear_cache, :proxy_http, :proxy_server

    def initialize(params)
      @binpartner = []
      @params = params

      params.each { |key, value| public_send("#{key}=", value) }
    end

    def get_link
      JSON.parse(@params.to_json).map { |key, value| key == "count_features" ? value.to_s : "#{key}=#{value.to_s}" }.join(" ")
    end

    def message(ws)
      if smoke_binpartner == true
        thread.to_i.times do
          @binpartner << Thread.new { puts "Clear cache".yellow; system "rake tmp:cache:clear"; puts "Cache clear done".yellow} if clear_cache == "true"
          @binpartner << Thread.new { puts; puts get_link.yellow; puts; system get_link ; ws.send("Test completed")}
        end
      end
    end

  end
end
