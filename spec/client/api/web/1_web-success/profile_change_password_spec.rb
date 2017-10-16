require 'rails_helper'

RSpec.describe "Change_password_profile" do

  before(:all) do
    @change = Profile.new.change_password("web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}",
    "12345q", "123456q", "123456q")

    @back_change = Profile.new.change_password("web", "ru", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", "#{Cookies.where(stage: "#{ENV['stage']}").last.authtoken}",
    "123456q", "12345q", "12345q")
  end

  context "params change password" do
    it { expect(@change['success']).to eq true }
    it { expect(@change['errors']).to eq [] }
  end

  context "params change back to change password" do
    it { expect(@back_change['success']).to eq true }
    it { expect(@back_change['errors']).to eq [] }
    it { expect(@back_change['data']['authtoken']).to eq Cookies.where(stage: "#{ENV['stage']}").last.authtoken }
  end
end
