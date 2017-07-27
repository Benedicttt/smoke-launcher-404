RSpec.describe "Api profile edit check errors" do
  let!(:locale) {{ locale: [{"field"=>"autorization", "message"=>"Не авторизован", "code"=>"unauthorized"}] }}
  let!(:invalid) {{ locale: [{"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}

  let!(:email) {{ invalid: [{"field"=>"email", "message"=>"Некорректный e-mail", "code"=>"invalid"}, {"field"=>"nickname", "message"=>"Не менее 3 символов", "code"=>"too_short"}] }}

  let!(:symbol) {{ err: [{"field"=>"last_name", "message"=>"Не менее 2 символов", "code"=>"too_short"},
                         {"field"=>"nickname", "message"=>"Не менее 3 символов", "code"=>"too_short"}] }}
  let!(:all) {{ err: [{"field"=>"email", "message"=>"Некорректный e-mail", "code"=>"invalid"},
                      {"field"=>"last_name", "message"=>"Не менее 2 символов", "code"=>"too_short"},
                      {"field"=>"nickname", "message"=>"Не менее 3 символов", "code"=>"too_short"}] }}

   context "params" do
     it "request " do
       expect(Profile.new.edit_error("", "ru", "RU", 23431, "Change First", "Change last", "Selenium", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                             "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq locale[:locale]
     end
     it "request " do
       expect(Profile.new.edit_error("we", "ru", "RU", 23431, "", "", "Selenium", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                             "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq locale[:locale]
     end
     it "request " do
       expect(Profile.new.edit_error("web", "ru", "RU", 23431, "Change First", "Change last", "", true, "",
                                            "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq email[:invalid]
     end
     it "request " do
       expect( Profile.new.edit_error("web", "ru", "RU", nil, "st", "t", "11", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                            "+79812323232", false, false, false, "", true )['errors']).to eq symbol[:err]
     end
     it "request " do
       expect( Profile.new.edit_error("web", "ru", "RU", nil, "st", "t", "11", "true", "@yopmail.com",
                                            "", "", "", "", "", "" )['errors']).to eq all[:err]
     end
   end
end
