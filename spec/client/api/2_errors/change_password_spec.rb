require 'rails_helper'

RSpec.describe "Remind faild" do
  let!(:locale) {{ locale: [{"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}
  let!(:no_reg) {{ no_reg: [{"field"=>"email", "message"=>"Указанный адрес не зарегистрирован в системе", "code"=>"email_not_exist"}] }}
  let!(:blank) {{ blank: [{"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}] }}

  context "params" do
    it { expect(Password.new.remind_error("we", "r", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}")['errors']).to eq locale[:locale]}
    it { expect(Password.new.remind_error("web", "ru", "321231123")['errors']).to eq no_reg[:no_reg] }
    it { expect(Password.new.remind_error("", "", "")['errors']).to eq blank[:blank] }
  end
end

RSpec.describe "Change faild" do
  let!(:locale) {{ locale: [{"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}
  let!(:blank) {{ blank: [{"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}] }}
  let!(:token) {{ invalid: [{"field"=>"token", "message"=>"Ссылка в письме устарела. Восстановите пароль заново.", "code"=>"token_invalid"}] }}
  let!(:invalid) {{ pass: [{"field"=>"password", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}, {"field"=>"password_confirmation", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}] }}
  let!(:pass) {{ pass: [{"field"=>"password", "message"=>"Не менее 6 символов", "code"=>"too_short"},
                        {"field"=>"password_confirmation", "message"=>"не совпадает со значением поля Пароль", "code"=>"confirmation"}] }}

  before(:context) { Password.new.change_error("", "", "", true, "", "") }
  context "params" do
    it { expect(Password.new.change_error("w","d","28748938792", false, "12345q", "12345q")['errors']).to eq locale[:locale] }
    it { expect(Password.new.change_error("web","d","28748938792", false, "12345q", "12345q")['errors']).to eq locale[:locale] }
    it { expect(Password.new.change_error("w","ru","28748938792", false, "12345q", "12345q")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("web","ru","28748938792", false, "12345q", "12345q")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345q", "12345")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345q", "")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("","ru","28748938792", false, "", "12345q")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345", "12345")['errors']).to eq token[:invalid] }
    it { expect(Password.new.change_error("","ru","28748938792", false, "", "")['errors']).to eq token[:invalid] }


    it { expect( Password.new.change_error("web", "ru", Cookies.where(stage: "#{ENV['stage']}").last.reset_password_token, false, "", "")['errors']).to eq invalid[:pass] }
    it { expect(Password.new.change_error("", "ru", Cookies.where(stage: "#{ENV['stage']}").last.reset_password_token, false, "2", "3")['errors']).to eq pass[:pass] }

  end
end
