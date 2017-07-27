require "rails_helper"

RSpec.describe "Authorize errors validations" do

  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}
  let!(:err_device) {{ err_device: [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
  let!(:err_server) {{ err_server: [ {"field"=>"sign_in", "message"=>"Логин или пароль введены неверно", "code"=>"wrong_credentials"} ] }}

  context "params" do
   it { expect( Authorized.new.get_auth('sb', 'ru',  '', '')['errors']).to eq err_device[:err_device] }
   it { expect( Authorized.new.get_auth('', 'ru',  '', '')['errors']).to eq err_device[:err_device] }
   it { expect( Authorized.new.get_auth('s', 'r',  '', '')['errors']).to eq err_locale[:err_locale] }
   it { expect( Authorized.new.get_auth('web', 'r',  '', '')['errors']).to eq err_locale[:err_locale] }
   it { expect( Authorized.new.get_auth('web', '', '', '')['errors']).to eq err_blank[:err_blank] }
   it { expect( Authorized.new.get_auth('web', 'ru', '', '')['errors']).to eq err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru', '1', '')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru', '.', '')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru', '[]', '')['errors']).to eq  err_server[:err_server] }
   it { expect( Authorized.new.get_auth('web', 'ru', ']', '')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru', '!@#$%^&*()_+]','')['errors']).to eq err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q','')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru','12345', 'email@yopmail.com')['success']).to eq false }
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', '')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', 'email@rehfuh')['errors']).to eq  err_server[:err_server]}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', '@yopmail.com')['errors']).to eq  err_server[:err_server]}
 end
end
