RSpec.describe "Change password profile errors" do
  context "request params run" do
    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['errors']).to eq not_authorize }
    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['success']).to eq false }
    it { expect(Profile.new.change_password_error("we", "ru", "", "","", "", "")['data']).to eq nil }

    it "new password error" do
      expect( Profile.new.change_password_error(
          "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "", "", "")['errors']
      ).to eq password_change_blank + password_current_blank + password_new_confirmation
    end

    it "errors passwords" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "", "", "")['errors']
      ).to eq password_change_blank + password_current_blank + password_new_confirmation
    end

    it "errors validation password" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}", "12345", "12345", "12345")['errors']
      ).to eq password_new_to_short + password_current_invalid
    end

    it "errors validation symbol password" do
      expect( Profile.new.change_password_error(
        "web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}","123435", "123435", "23321322345")['errors']
      ).to eq password_new_empty + password_empty_confirmation + password_current_invalid
    end
  end
end
