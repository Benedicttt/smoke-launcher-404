$config_api = YAML.load_file('./config/scenarios/common_setting_api.yml')
$uuid = "36ff4103-8a37-42ed-84d3-78c9ce96458f"

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
