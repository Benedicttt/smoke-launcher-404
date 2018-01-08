def first_last_name
    @email_auth = User.where(stage_number: ENV['stage']).last.email
    @authorized = RestClient.post "https://#{ENV['stage']}.binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] != "prod"
    @profile = RestClient.get("https://#{ENV['stage']}.binomo.com/api/profile", {
                  params: {
                    locale: 'ru',
                    device: 'web',
                    geo: "RU"
                  },
                  cookies: @authorized.cookies
                }) if ENV['stage'] != "prod"

    @authorized = RestClient.post "https://binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] == "prod"
    @profile = RestClient.get("https://binomo.com/api/profile", {
                  params: {
                    locale: 'ru',
                    device: 'web',
                    geo: "RU"
                    },
                    cookies: @authorized.cookies
                }) if ENV['stage'] == "prod"

  if JSON.parse(@profile.body)['data'].nil?
    puts_danger "Not authorized"
  else
    sleep 1
    first_name =  JSON.parse(@profile.body)['data']['first_name']
    last_name =  JSON.parse(@profile.body)['data']['last_name']
    nickname =  JSON.parse(@profile.body)['data']['nickname']
    phone =  JSON.parse(@profile.body)['data']['phone']
    gender =  JSON.parse(@profile.body)['data']['gender']
    receive_news =  JSON.parse(@profile.body)['data']['receive_news']
    id =  JSON.parse(@profile.body)['data']['id']
    puts_success("
                  First name: #{first_name};
                  Last name: #{last_name};
                  Nickname: #{nickname};
                  Phone: #{phone};
                  Gender: #{gender};
                  Receive news: #{receive_news};
                  Id: #{id};
                  ")
    sleep 1

    que "update users set
          first_name = '#{first_name}',
          last_name = '#{last_name}',
          updated_at = '#{Time.now}'
        where id = '#{id}';"
  end
end
