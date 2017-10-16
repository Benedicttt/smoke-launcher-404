require "rails_helper"

RSpec.describe "Api server succes" do
  before(:context) { @device_id = $uuid, @app_version = "1.0" }

  context "params" do
    it { expect(ApiApp.new.get_server("server", "server." + SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200", @device_id, @app_version)['success']).to eq true }
    it { expect(ApiApp.new.get_server("server", "server." + SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200", @device_id, @app_version)['data']) == {} }
    it { expect(ApiApp.new.get_server("server", "server.#{SecureRandom.hex(8)}@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200", @device_id, @app_version)['errors']).to eq [] }
  end
end
