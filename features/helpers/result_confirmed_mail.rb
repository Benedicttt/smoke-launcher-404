def result_confirmed_mail
    @email_auth = User.where(stage_number: ENV['stage']).last.email
    @authorized = RestClient.post "https://#{ENV['stage']}.binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] != "prod"
    @profile = RestClient.get("https://#{ENV['stage']}.binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] != "prod"

    @authorized = RestClient.post "https://binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] == "prod"
    @profile = RestClient.get("https://binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] == "prod"

  if JSON.parse(@profile.body)['data'].nil?
    puts_danger "Not authorized"
  else
    sleep 1
    email_verified =  JSON.parse(@profile.body)['data']['email_verified']
    id =  JSON.parse(@profile.body)['data']['id']
    puts_success("Email verified: #{email_verified}")
    sleep 2
    que "update users set email_confirmed = '#{email_verified}' where id = '#{id}';"
  end
end
