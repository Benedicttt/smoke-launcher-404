require "rails_helper"

RSpec.describe "Api server succes" do
  context "params" do
    it { expect(Api.new.get_server("server", "server." + SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['success']).to eq true }
    it { expect(Api.new.get_server("server", "server." + SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['data']) == {} }
    it { expect(Api.new.get_server("server", "server.#{SecureRandom.hex(8)}@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq [] }
  end
end
