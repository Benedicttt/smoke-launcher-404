require 'rails_helper'

RSpec.describe "Assets success" do
  before(:context) do
    Assets.new.get("web", "ru" )[0]['data']['assets'].map { |k| @assets = k if k["name"] == "FOR/HEIGHT"}.compact
  end

  context "params" do

  it { expect(@assets['name']).to eq "FOR/HEIGHT"}
  it { expect(@assets['ric']).to eq "GOL/OTC"}
  it { expect(@assets['type']).to eq 1}
  it { expect(@assets['payment_rate_turbo']).to be_in [ 83, 84 ] }
  it { expect(@assets['payment_rate_binary']).to be_in [ 84, 85 ] }

  it "schedule" do
    expect(@assets['schedule']).to eq "sun"=>[["00:00", "23:59"]],
                                      "mon"=>[["00:00", "23:59"]],
                                      "tue"=>[["00:00", "23:59"]],
                                      "wed"=>[["00:00", "23:59"]],
                                      "thu"=>[["00:00", "23:59"]],
                                      "fri"=>[["00:00", "23:59"]],
                                      "sat"=>[["00:00", "23:59"]]
  end

  it { expect(@assets['sort']).to be_a Integer}
  it { expect(@assets['active']).to eq true}
  it { expect(@assets['enabled_for_demo']).to eq true}
  it { expect(@assets['daily']).to eq false}
  it { expect(URI.parse(@assets['icon']['url']).host).to eq "#{ENV['stage'].gsub(/[.]/, '')}-as.binomo.com"}
  end
end
