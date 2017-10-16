RSpec.describe "Api profile edit check errors" do
   context "params" do
     it "request " do
       expect(Profile.new.edit_error("", "ru", "RU", 23431, "Change First", "Change last", "Selenium", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                             "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq not_authorize
     end
     it "request " do
       expect(Profile.new.edit_error("we", "ru", "RU", 23431, "", "", "Selenium", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                             "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq not_authorize
     end
     it "request " do
       expect(Profile.new.edit_error("web", "ru", "RU", 23431, "Change First", "Change last", "", true, "",
                                            "+79812323232", false, false, false, "1991-02-04", true )['errors']).to eq email_invalid + nickname_length
     end
     it "request " do
       expect( Profile.new.edit_error("web", "ru", "RU", nil, "st", "t", "11", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                            "+79812323232", false, false, false, "", true )['errors']).to eq email_invalid + last_name_length + nickname_length
     end
     it "request " do
       expect( Profile.new.edit_error("web", "ru", "RU", nil, "st", "t", "11", "true", "@yopmail.com",
                                            "", "", "", "", "", "" )['errors']).to eq email_invalid + last_name_length + nickname_length
     end
   end
end
