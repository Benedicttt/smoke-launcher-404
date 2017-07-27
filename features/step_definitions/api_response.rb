require 'rest-client'

class ApiResponse
  def self.run
    @config = RestClient.get("https://#{ENV['stage']}.binomo.com/api/config", {params: {locale: 'ru', device: 'web'}}) if ENV['stage'] != "prod"
    @authorized = RestClient.post("https://#{ENV['stage']}.binomo.com/api/sign_in?email=#{EMAIL}", $config_api['web_auth'], cookies: @config.cookies) if ENV['stage'] != "prod"
    @profile = RestClient.get("https://#{ENV['stage']}.binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] != "prod"

    @config = RestClient.get("https://binomo.com/api/config", {params: {locale: 'ru', device: 'web'}}) if ENV['stage'] == "prod"
    @authorized = RestClient.post("https://binomo.com/api/sign_in?email=#{EMAIL}", $config_api['web_auth'], cookies: @config.cookies) if ENV['stage'] == "prod"
    @profile = RestClient.get("https://binomo.com/api/profile", {params: { locale: 'ru', device: 'web' }, cookies: @authorized.cookies}) if ENV['stage'] == "prod"


    if JSON.parse(@profile.body)['data'].nil?
      puts_danger "Not authorized"
    else
      id = JSON.parse(@profile.body)['data']['id']
      email_verified = JSON.parse(@profile.body)['data']['email_verified']
      val = JSON.parse(@profile.body)['data']['currency']
      email = JSON.parse(@profile.body)['data']['email']
      phone = JSON.parse(@profile.body)['data']['phone_verified']
      documnets = JSON.parse(@profile.body)['data']['docs_verified']

      regions = ENV['geo']

           que "INSERT INTO users(
                email_confirmed, id, platform, email, locale, currency, password,
                stage_number, geo_locale, created_at, phone_verifed, document_verifed, driver)
               values(
                  '#{email_verified}',
                 '#{id}',
                 'binomo',
                 '#{email}',
                 '#{ENV['locale']}',
                 '#{val}',
                 '#{CommonSetting[:user_test]['pass_platform']}',
                 '#{ENV['stage']}',
                 '#{regions}',
                 '#{Time.now}',
                 '#{phone}',
                 '#{documnets}',
                 '#{ENV['driver']}')
                 ;"

      User.find(id).update(refcode: ENV['refcode'], branch: File.read("./features/temporary/binomo_branch_#{ENV['staging']}").sub(/\n/, ''))
      Cookies.create(id: id, cookies_traider: @authorized.cookies.to_json)

      id = User.where(stage_number: ENV['stage']).last.id
      email = User.where(stage_number: ENV['stage']).last.email

      print "<p class='alert alert-success'> Geo: #{regions} Locale: #{ENV['locale']} Currency:  #{val} #{link_report_id("#{CommonSetting[:url_user_crm]}/#{id}", " CRM: #{email}")}  #{link_report_id('http://www.yopmail.com/ru/', ' YopmaiL')}</p>"
      print "#{copy_clipboard(email, "email_crm", "EMAIL copy")}<br>"
      print "<br>#{copy_clipboard("#{CommonSetting[:user_test]['pass_platform']}", "password_platform", "PASS copy")}"
      print "<br>#{copy_clipboard(id, "id_crm", "ID copy")}"
    end

  end
end
