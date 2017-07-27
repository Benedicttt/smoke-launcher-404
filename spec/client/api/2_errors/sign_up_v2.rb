require "rails_helper"

RSpec.describe "Registration errors validations v2" do

  let!(:err_locale) {{ err_locale: [ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}
  let!(:err_device) {{ err_device: [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
  let!(:err_pass) {{ err_pass: [ {"field"=>"password", "message"=>"Не менее 6 символов", "code"=>"too_short"},
      {"field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank"},
      {"field"=>"i_agree", "message"=>"Вы должны согласиться с правилами","code"=>"blank"} ]
   }}

  let!(:err_pass_length) {{ err_pass_length:
    [ {"field"=>"password", "message"=>"Должен содержать и буквы, и цифры", "code"=>"invalid"},
      {"field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank"},
      {"field"=>"i_agree", "message"=>"Вы должны согласиться с правилами","code"=>"blank"} ]
  }}

  let!(:err_email_empty) {{ err_email_empty:
    [ {"field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank"} ]
   }}

  let!(:err_email_empty_two) {{ err_email_empty_two:
    [ {"field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank"},
      {"field"=>"i_agree", "message"=>"Вы должны согласиться с правилами","code"=>"blank"} ]
   }}

  let!(:err_email_invalid) {{ err_email_invalid:
    [ {"field"=>"email", "message"=>"Некорректный e-mail", "code"=>"invalid"},
      {"field"=>"i_agree", "message"=>"Вы должны согласиться с правилами","code"=>"blank"} ]
   }}

  let!(:err_email_created) {{ err_email_created:
    [  {"field"=>"email", "message"=>"Указанный адрес уже зарегистрирован", "code"=>"taken"} ]
   }}

  let!(:err_all_params) {{ err_all_params:
      [ {"field" => "password", "message" => "Поле обязательно для заполнения", "code" =>  "blank"},
        {"field" =>  "email", "message" =>  "Вы не ввели e-mail", "code" =>  "blank"},
        {"field" => "i_agree", "message" =>  "Вы должны согласиться с правилами", "code" =>  "blank"} ]
     }}

   context "params" do
     it { expect( Reg.new.post_sign_up_v2('sb', 'ru', '', '', '')[0]['errors']).to eq err_device[:err_device] }
     it { expect( Reg.new.post_sign_up_v2('web', 'r', '', '', '')[0]['errors']).to eq err_locale[:err_locale] }
     it { expect( Reg.new.post_sign_up_v2('web', '', '', '', '')[0]['errors']).to eq err_blank[:err_blank] }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '', '', '')[0]['errors']).to eq err_all_params[:err_all_params] }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '1', '', '')[0]['errors']).to eq  err_pass[:err_pass]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '.', '', '')[0]['errors']).to eq  err_pass[:err_pass]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '[]', '', '')[0]['errors']).to eq  err_pass[:err_pass]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', ']', '', '')[0]['errors']).to eq  err_pass[:err_pass]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '!@#$%^&*()_+]', '', '')[0]['errors']).to eq  err_pass_length[:err_pass_length]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', '')[0]['errors']).to eq  err_email_empty_two[:err_email_empty_two]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', 'ss', 'email@yopmail.com')[0]['errors']).to eq  err_email_created[:err_email_created]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', 'huj', '')[0]['errors']).to eq  err_email_empty[:err_email_empty]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', 'email@rehfuh')[0]['errors']).to eq  err_email_invalid[:err_email_invalid]}
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', '@yopmail.com')[0]['errors']).to eq  err_email_invalid[:err_email_invalid]}
   end
end
