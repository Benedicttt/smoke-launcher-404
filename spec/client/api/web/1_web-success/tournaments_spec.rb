require 'rails_helper'

RSpec.describe "Api tournaments success" do
  before(:context) do
    @tournaments = Tournaments.new.api("ru", "web")
    $id = @tournaments['data'][0]['id']
    @time_now = @tournaments['data'][0]['data_form']
  end

  context "params" do
    it { expect(@tournaments['success']).to eq true }
    it { expect(@tournaments['errors']).to eq [] }
    it { expect(@tournaments['data'].class).to eq Array }
    it { expect(@tournaments['data'][0]['id']).to be_a(Integer) }
    it { expect(@tournaments['data'][0]['id']).to eq $id }
    it { expect(@tournaments['data'][0]['name']).to be_a(String) }
    it { expect(@tournaments['data'][0]['url']).to be_a(String) }
    it { expect(@tournaments['data'][0]['content']).to be_a(String) }
    it { expect(@tournaments['data'][0]['name'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['url'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['content'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['banner_preview']).to be_a(String) }
    it { expect(@tournaments['data'][0]['banner_preview'].nil?).to eq false }
    # it { expect(@tournaments['data'][0]['data_form'].strftime("%Y-%d-%m %H:%M:%S %z")).to eq @time_now}
    it { expect(@tournaments['data'][0]['count_winners']).to be_a(Integer)}

    it { expect(@tournaments['data'][0]['count_winners'].to_i > 0).to eq true }
    it { expect(@tournaments['data'][0]['user_involved']).to eq false }
    it { expect(@tournaments['data'][0]['users_count']).to be_a(Integer) }
    it { expect(@tournaments['data'][0]['initial_balance']).to be_a(Integer) }
    it { expect(@tournaments['data'][0]['participation_fee']).to be_a(Integer) }
    it { expect(@tournaments['data'][0]['prize_fund']).to be_a(Integer) }
    it { expect(@tournaments['data'][0]['timeline_status']).to eq "actual" }
    it { expect(@tournaments['data'][0]['currency_iso']).to eq nil }
      # "date_from"=>"2017-10-24T08:50:00.000Z", "date_to"=>"2017-10-24T09:00:00.000Z", "count_winners"=>2, "user_involved"=>false, "users_count"=>0, "initial_balance"=>10000, "participation_fee"=>nil, "prize_fund"=>nil, "timeline_status"=>"future", "currency_iso"=>nil}
  end
end
