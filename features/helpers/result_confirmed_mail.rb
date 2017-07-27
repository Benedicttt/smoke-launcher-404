def result_confirmed_mail
  begin
    User.pluck(:email, :stage_number).each { |r| @email_auth = r[0] if r[1] == "#{ENV['stage']}"}
    User.pluck(:id, :stage_number).each { |r| @id = r[0] if r[1] == "#{ENV['stage']}"}
  rescue
    @email_auth = User.last.email
  end

    @authorized = RestClient.post "https://#{ENV['stage']}.binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] != "prod"
    @profile = RestClient.get("https://#{ENV['stage']}.binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] != "prod"

    @authorized = RestClient.post "https://binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] == "prod"
    @profile = RestClient.get("https://binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] == "prod"

  if JSON.parse(@profile.body)['data'].nil?
    puts_danger "Not authorized"
  else
    email_verified =  JSON.parse(@profile.body)['data']['email_verified']
    id =  JSON.parse(@profile.body)['data']['id']
    puts_success("Email verified: #{email_verified}")
    sleep 1
    que "update users set email_confirmed = '#{email_verified}' where id = '#{id}';"
  end
end
