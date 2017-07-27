$config_api = YAML.load_file('./config/scenarios/common_setting_api.yml')

$link_binomo_auth_200 = File.read("./spec/client/pages/authorize/link_binomo_auth_200")
$link_binomo_200 = File.read("./spec/client/pages/unauthorize/link_binomo_200")
$link_binomo_404 = File.read("./spec/client/pages/unauthorize/link_binomo_404")

$link_binpartner_adm_200 = File.read("./spec/client/pages/authorize/link_adm_partner_200")
$link_auth_platform_binpartner_200 = File.read("./spec/client/pages/authorize/link_platform_partner_200")
$link_noauth_platform_binpartner_200 = File.read("./spec/client/pages/unauthorize/link_platform_partner_200")

$link_crm_1 = File.read("./spec/client/pages/unauthorize/link_crm_200")
$link_crm_2 = File.read("./spec/client/pages/unauthorize/link_crm_parse_200")

ENV['RAILS_ENV'] ||= 'test'
ENV['api_host'] = "https://#{ENV['stage']}binomo.com/api"

class Constant
  def self.email
    email ||= SecureRandom.hex(8)
  end
end
$email_num = Constant.email

def data(page, key)
  params = JSON.parse(page.body)[key]
end
