require 'rubygems'
require 'eventmachine'
require 'faye/websocket'
require 'json'

class RequestWsError
  def send_ws(device, demo, asset, expire_at, amount, option_type, deal_type, trend, count, tournament_id, stage, ref)

    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response_auth = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        content_type: 'text/plain',
        params:{
          email: Cookies.where(stage: "#{ENV['stage']}").last.email,
          password: "12345q",
          locale: "ru",
          device: "web",
          geo: "RU"
        }
      })

      api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
      @response = RestClient.get(
        api_conf_up,
        cookies: @response_auth.cookies,
         params: {
           locale: 'ru',
           device: 'web'
       }) { |response, request, result, &block| response }

     authtoken = JSON.parse(@response_auth)['data']['authtoken']
     device_id = JSON.parse(@response)['data']['device_id']

    # connect ws
    EM.run {
      ws = Faye::WebSocket::Client.new("wss://#{ENV['stage'].sub(/[.]/, '')}-ws.binomo.com:8080/?vsn=2.0.0")
      ws.on :open do |event|
        phx_join = {
                   "topic":"base",
                   "event":"phx_join",
                   "payload": {
                     "authtoken":authtoken,
                     "device":device,
                     "device_id":device_id },
                     "ref":"#{ref}",
                     "join_ref":"1"
                   }

        message = JSON.dump(phx_join)
        ws.send(message)
        sleep 0.2
      end

      ws.on :message do |msg|
        params = {
                 "topic":"base",
                 "event":"create_deal",
                 "payload": {
                    "device":device,
                    "demo":demo,
                    "asset":asset,
                    "expire_at":expire_at,
                    "amount":amount,
                    "source":"mouse",
                    "trusted":false,
                    "created_at":Time.now.to_i,
                    "option_type":option_type,
                    "deal_type":deal_type,
                    "trend":trend,
                    "tournament_id":tournament_id

                  },
                "ref":"2",
                "join_ref":"#{ref + 1}"
              }

        demo_request = JSON.dump(params)
        count.times { ws.send demo_request; sleep 0.01 }


        # puts msg.data
        $result = JSON.parse(msg.data)
        return $result if $result['payload']['status'] == 'error'
      end
    }
  end
end
