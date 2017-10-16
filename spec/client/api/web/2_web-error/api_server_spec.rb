require "rails_helper"

RSpec.describe "Api server errors false validations" do
    context "params" do
      it { expect(Api.new.get_server("serv", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq device }
      it { expect(Api.new.get_server("", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq device }
      it { expect(Api.new.get_server("server", "@yopmail.com" ,"ru",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq email_invalid }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"r",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq locale }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"",  "12345q", "RUB", true, "192.168.4.200")['errors']).to eq blank }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "", "RUB", true, "192.168.4.200")['errors']).to eq signature_server }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "q", "EUR", true, "192.168.4.200")['errors']).to eq pass_length }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "1", "USD", true, "192.168.4.200")['errors']).to eq pass_length }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "UB", true, "192.168.4.200")['errors']).to eq currency_invalid }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "", true, "192.168.4.200")['errors']).to eq signature_server }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", "", "192.168.4.200")['errors']).to eq signature_server }
      it { expect(Api.new.get_server("server", SecureRandom.hex(8) + "@yopmail.com" ,"ru",  "12345q", "RUB", true, "")['errors']).to eq ip_blank + signature_server }
    end
end
