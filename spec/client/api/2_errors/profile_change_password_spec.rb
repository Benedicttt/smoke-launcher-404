RSpec.describe "Change password profile errors" do
  let!(:auth) { {"field"=>"autorization", "message"=>"Не авторизован", "code"=>"unauthorized"} }
  let!(:new_password) { {"field"=>"new_password", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} }

  let!(:blank_password) {[
     {"field"=>"new_password", "message"=>"Поле обязательно для заполнения", "code"=>"blank"},
     {"field"=>"current_password", "message"=>"Поле обязательно для заполнения", "code"=>"blank"},
     {"field"=>"new_password_confirmation", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}] }

  let!(:validation_password) {[
    {"field"=>"new_password", "message"=>"Не менее 6 символов", "code"=>"too_short"},
    {"field"=>"new_password_confirmation", "message"=>"не совпадает со значением поля Новый пароль", "code"=>"confirmation"},
    {"field"=>"current_password", "message"=>"Текущий пароль неверен", "code"=>"password_invalid"}] }

  let!(:invalid_password) {[
    {"field"=>"new_password", "message"=>"Не менее 6 символов", "code"=>"too_short"},
    {"field"=>"current_password", "message"=>"Текущий пароль неверен", "code"=>"password_invalid"}] }

  let!(:invalid_symbol) {[
    {"field"=>"new_password", "message"=>"Должен содержать и буквы, и цифры", "code"=>"invalid"},
    {"field"=>"new_password_confirmation", "message"=>"не совпадает со значением поля Новый пароль", "code"=>"confirmation"},
    {"field"=>"current_password", "message"=>"Текущий пароль неверен", "code"=>"password_invalid"}] }

  context "request params run" do

    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['errors'][0]).to eq auth }
    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['success']).to eq false }
    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['data']).to eq nil }

    it "new password error" do
      expect( Profile.new.change_password_error(
          "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "", "", "")['errors'][0]
      ).to eq new_password
    end

    it "errors passwords" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "", "", "")['errors']
      ).to eq blank_password
    end

    it "errors validation password" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "12345", "12345", "12345")['errors']
      ).to eq invalid_password
    end

    it "errors validation symbol password" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}","123435", "123435", "23321322345")['errors']
      ).to eq invalid_symbol
    end
  end
end
