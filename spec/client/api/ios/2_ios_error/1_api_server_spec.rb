require "rails_helper"

RSpec.describe "Api server errors false validations" do
  context "params" do
    it { expect(ApiApp.new.get_server("serv", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200", "", "")['errors']).to eq device }
    it { expect(ApiApp.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "", "43434343", "")['errors']).to eq ip_blank + signature_server }
    it { expect(ApiApp.new.get_server("ios", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200", "3234324", "43443342")['errors']).to eq device }
  end
end
