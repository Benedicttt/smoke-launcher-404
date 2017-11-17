require 'rails_helper'

RSpec.describe "Deals real success, turbo validations put(won)" do
  before(:all) do
    @deal_list_data = Deals.new.list_close_demo("web", "ru")[0]['data']['deals'][0]
    print "#{(Time.parse(@deal_list_data['finished_at']) - Time.parse(@deal_list_data['created_at'])).to_i}".green
    sleep (Time.parse(@deal_list_data['finished_at']) - Time.parse(@deal_list_data['created_at'])).to_i + 5
    @closed_deal_data = Deals.new.list_close_demo("web", "ru")[0]['data']['deals'][0]
    sleep 1
  end

  context "params" do
    it {expect(@deal_list_data['create_at']).to eq @closed_deal_data['create_at']}
    it {expect(@deal_list_data['entrie_rate']).to eq @closed_deal_data['entrie_rate']}
    it {expect(@deal_list_data['entrie_created_at']).to eq @closed_deal_data['entrie_created_at']}
    it {expect(@deal_list_data['bet']).to eq @closed_deal_data['bet']}
    it {expect(@deal_list_data['payment']).to eq @closed_deal_data['payment']}
    it {expect(@deal_list_data['option_type']).to eq @closed_deal_data['option_type']}
    it {expect(@deal_list_data['payment_rate']).to eq @closed_deal_data['payment_rate']}
    it {expect(@deal_list_data['demo']).to eq @closed_deal_data['demo']}
    it {expect(@deal_list_data['win']).to eq 0 }
    it {expect(@closed_deal_data['win']).to eq 1000 + Assets.new.get('web', 'ru')[1][0]*10 }
    it {expect(@deal_list_data['end_rate']) != @closed_deal_data['end_rate']}
    it {expect(@deal_list_data['status']) != @closed_deal_data['status']}
    it {expect(@deal_list_data['id']).to eq @closed_deal_data['id']}
    it {expect(@deal_list_data['asset']).to eq @closed_deal_data['asset']}
    it {expect(@deal_list_data['ric']).to eq @closed_deal_data['ric']}
    it {expect(@deal_list_data['create_at']).to eq @closed_deal_data['create_at']}
    it {expect(@deal_list_data['name']).to eq @closed_deal_data['name']}
    it {expect(@deal_list_data['trend']).to eq @closed_deal_data['trend']}
    it {expect(@deal_list_data['status']).to eq "open"}
    it {expect(@closed_deal_data['status']).to eq "won"}
  end
end

RSpec.describe "Deals real success, turbo validations call(lost)" do
  before(:all) do
    @deal_list_data = Deals.new.list_close_demo("web", "ru")[0]['data']['deals'][1]
    @closed_deal_data = Deals.new.list_close_demo("web", "ru")[0]['data']['deals'][1]
    sleep 1
  end

  context "params" do
    it {expect(@deal_list_data['create_at']).to eq @closed_deal_data['create_at']}
    it {expect(@deal_list_data['entrie_rate']).to eq @closed_deal_data['entrie_rate']}
    it {expect(@deal_list_data['entrie_created_at']).to eq @closed_deal_data['entrie_created_at']}
    it {expect(@deal_list_data['bet']).to eq @closed_deal_data['bet']}
    it {expect(@deal_list_data['payment']).to eq @closed_deal_data['payment']}
    it {expect(@deal_list_data['option_type']).to eq @closed_deal_data['option_type']}
    it {expect(@deal_list_data['payment_rate']).to eq @closed_deal_data['payment_rate']}
    it {expect(@deal_list_data['demo']).to eq @closed_deal_data['demo']}
    it {expect(@deal_list_data['win']).to eq @closed_deal_data['win']}
    it {expect(@deal_list_data['end_rate']) != @closed_deal_data['end_rate']}
    it {expect(@deal_list_data['status']) != @closed_deal_data['status']}
    it {expect(@deal_list_data['id']).to eq @closed_deal_data['id']}
    it {expect(@deal_list_data['asset']).to eq @closed_deal_data['asset']}
    it {expect(@deal_list_data['ric']).to eq @closed_deal_data['ric']}
    it {expect(@deal_list_data['create_at']).to eq @closed_deal_data['create_at']}
    it {expect(@deal_list_data['name']).to eq @closed_deal_data['name']}
    it {expect(@deal_list_data['trend']).to eq @closed_deal_data['trend']}
    it {expect(@deal_list_data['status']).to eq "lost"}
    it {expect(@closed_deal_data['status']).to eq "lost"}
  end
end
