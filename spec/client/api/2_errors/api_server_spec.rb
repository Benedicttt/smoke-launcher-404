require "rails_helper"

RSpec.describe "Api server errors false validations" do

    let!(:err_locale) {{ err_locale: [ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
    let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}
    let!(:err_device) {{ err_device: [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
    let!(:err_server) {{ err_server: [ {"field"=>"sign_in", "message"=>"Логин или пароль введены неверно", "code"=>"wrong_credentials"} ] }}
    let!(:err_pass) {{ err_pass: [ {"field"=>"password", "message"=>"Не менее 6 символов", "code"=>"too_short"}] }}
    let!(:err_email_invalid) {{ err_email_invalid:[ {"field"=>"email", "message"=>"Некорректный e-mail", "code"=>"invalid"} ] }}
    let!(:err_signature) {{ err_signature:[{"field"=>"signature", "message"=>"Ошибки валидации", "code"=>"invalid"}] }}
    let!(:err_currency) {{ err_currency:[{"field"=>"currency", "message"=>"Ошибки валидации", "code"=>"invalid"}] }}
    let!(:err_device) {{ err_device:[ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}

    let!(:err_ip) {{ err_ip: [{"field"=>"ip", "message"=>"Поле обязательно для заполнения", "code"=>"blank"},
        {"field"=>"signature", "message"=>"Ошибки валидации", "code"=>"invalid"}] }}

    context "params" do
      it { expect(Api.new.get_server("serv", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq err_device[:err_device] }
      it { expect(Api.new.get_server("", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq err_device[:err_device] }
      it { expect(Api.new.get_server("server", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq err_email_invalid[:err_email_invalid] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"r",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq err_locale[:err_locale] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq err_blank[:err_blank] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "", "RUB", true, "192.168.4.200")['errors']).to eq err_signature[:err_signature] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "q", "EUR", true, "192.168.4.200")['errors']).to eq err_pass[:err_pass] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "1", "USD", true, "192.168.4.200")['errors']).to eq err_pass[:err_pass] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "UB", true, "192.168.4.200")['errors']).to eq err_currency[:err_currency] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "", true, "192.168.4.200")['errors']).to eq err_signature[:err_signature] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", "", "192.168.4.200")['errors']).to eq err_signature[:err_signature] }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "")['errors']).to eq err_ip[:err_ip]}
    end
end
