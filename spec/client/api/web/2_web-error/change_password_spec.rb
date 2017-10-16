require 'rails_helper'

RSpec.describe "Remind faild" do
  context "params" do
    it { expect(Password.new.remind_error("we", "r", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}")['errors']).to eq locale}
    it { expect(Password.new.remind_error("web", "ru", "321231123")['errors']).to eq email_not_exist }
    it { expect(Password.new.remind_error("", "", "")['errors']).to eq blank }
  end
end

RSpec.describe "Change faild" do
  before(:context) { Password.new.change_error("", "", "", true, "", "") }
  context "params" do
    it { expect(Password.new.change_error("w","d","28748938792", false, "12345q", "12345q")['errors']).to eq locale }
    it { expect(Password.new.change_error("web","d","28748938792", false, "12345q", "12345q")['errors']).to eq locale }
    it { expect(Password.new.change_error("w","ru","28748938792", false, "12345q", "12345q")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("web","ru","28748938792", false, "12345q", "12345q")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345q", "12345")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345q", "")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("","ru","28748938792", false, "", "12345q")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("","ru","28748938792", false, "12345", "12345")['errors']).to eq token_invalid }
    it { expect(Password.new.change_error("","ru","28748938792", false, "", "")['errors']).to eq token_invalid }
    it { expect( Password.new.change_error("web", "ru", Cookies.where(stage: "#{ENV['stage']}").last.reset_password_token, false, "", "")['errors']).to eq pass_blank + pass_confirmation }
    it { expect(Password.new.change_error("", "ru", Cookies.where(stage: "#{ENV['stage']}").last.reset_password_token, false, "2", "3")['errors']).to eq pass_length + pass_empty_confirmation }
  end
end
