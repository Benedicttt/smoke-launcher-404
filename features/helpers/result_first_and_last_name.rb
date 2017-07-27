def first_last_name
  begin
    User.pluck(:email, :stage_number).each { |r| @email_auth = r[0] if r[1] == "#{ENV['stage']}"}
    User.pluck(:id, :stage_number).each { |r| @id = r[0] if r[1] == "#{ENV['stage']}"}
  rescue
    @email_auth = User.last.email
  end

    @authorized = RestClient.post "https://#{ENV['stage']}.binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] != "prod"
    @profile = RestClient.get("https://#{ENV['stage']}.binomo.com/api/profile", {params: { locale: 'ru', device: 'web', geo: "RU" }, cookies: @authorized.cookies}) if ENV['stage'] != "prod"

    @authorized = RestClient.post "https://binomo.com/api/sign_in?email=#{@email_auth}", $config_api['web_auth'] if ENV['stage'] == "prod"
    @profile = RestClient.get("https://binomo.com/api/profile", {params: { locale: 'ru', device: 'web', geo: "RU" }, cookies: @authorized.cookies}) if ENV['stage'] == "prod"

  if JSON.parse(@profile.body)['data'].nil?
    puts_danger "Not authorized"
  else
    @first_name =  JSON.parse(@profile.body)['data']['first_name']
    @last_name =  JSON.parse(@profile.body)['data']['last_name']
    @id =  JSON.parse(@profile.body)['data']['id']
    puts_success(" First name: #{@first_name}; Last name: #{@last_name} ")
    sleep 1
    que "update users set first_name = '#{@first_name}', last_name = '#{@last_name}', updated_at = '#{Time.now}' where id = '#{@id}';"
  end
end
