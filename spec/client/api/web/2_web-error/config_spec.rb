require 'rails_helper'

RSpec.describe "Config request in api errors validations" do
  context "params" do
    it { expect(Config.new.get_web('web', 'r', 'RU')['success']).to eq false }
    it { expect(Config.new.get_web('web', 'r', 'RU')['data']).to eq nil }
    it { expect(Config.new.get_web('we', 'r', 'RU')['errors']).to eq locale }
    it { expect(Config.new.get_web('we', '', 'RU')['errors']).to eq blank }
    it { expect(Config.new.get_web('web', 'r', 'RU')['errors']).to eq locale }
    it { expect(Config.new.get_web('we', 'ru', 'RU')['success']).to eq true }
  end
end

RSpec.describe "Config request in api errors validations, not geo" do
  context "params" do
    it { expect(Config.new.get_config('web', 'r')['success']).to eq nil }
    it { expect(Config.new.get_config('web', 'r')['data']).to eq nil }
    it { expect(Config.new.get_config('we', 'r')['errors']).to eq nil }
    it { expect(Config.new.get_config('we', '')['errors']).to eq nil }
    it { expect(Config.new.get_config('web', 'r')['errors']).to eq nil }
    it { expect(Config.new.get_config('we', 'ru')['success']).to eq nil }
  end
end

RSpec.describe "Config request in api errors validations v2" do
  context "params" do
    it { expect(Config.new.get_web_v2('web', 'r', 'RU')['success']).to eq false }
    it { expect(Config.new.get_web_v2('web', 'r', 'RU')['data']).to eq nil }
    it { expect(Config.new.get_web_v2('we', 'r', 'RU')['errors']).to eq locale }
    it { expect(Config.new.get_web_v2('we', '', 'RU')['errors']).to eq blank }
    it { expect(Config.new.get_web_v2('web', 'r', 'RU')['errors']).to eq locale }
    it { expect(Config.new.get_web_v2('we', 'ru', 'RU')['success']).to eq true }
  end
end

RSpec.describe "Config request in api errors validations, not geo v2" do
  context "params" do
    it { expect(Config.new.get_config_v2('web', 'r')['success']).to eq false }
    it { expect(Config.new.get_config_v2('web', 'r')['data']).to eq nil }
    it { expect(Config.new.get_config_v2('we', 'r')['errors']).to eq locale }
    it { expect(Config.new.get_config_v2('we', '')['errors']).to eq blank }
    it { expect(Config.new.get_config_v2('web', 'r')['errors']).to eq locale }
    it { expect(Config.new.get_config_v2('we', 'ru')['success']).to eq true }
  end
end
