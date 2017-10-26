require 'rails_helper'

RSpec.describe "Api tournaments success" do
  before(:context) do
    @tournaments = Tournaments.new.api("ru", "web")
    ids = []
    ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" }
    id = ids[0][0]

    email = Cookies.where(stage: "#{ENV['stage']}").last.email
    password = "12345q"
    @part = Tournaments.new.participate("ru", "web", password, email, id)
  end

  context "params" do
    it { puts @part }

    # it { @tournaments['data'].each { |k, v| k['id'] if k['timeline_status'] == "actual" } }
    # it { expect(@tournaments['success']).to eq true }
    # it { expect(@tournaments['errors']).to eq [] }
    # it { expect(@tournaments['data'].class).to eq Array }
    # it { expect(@tournaments['data'][0]['id']).to be_a(Integer) }
    # it { expect(@tournaments['data'][0]['id']).to eq $id }
    # it { expect(@tournaments['data'][0]['name']).to be_a(String) }
    # it { expect(@tournaments['data'][0]['url']).to be_a(String) }
    # it { expect(@tournaments['data'][0]['content']).to be_a(String) }
    # it { expect(@tournaments['data'][0]['name'].nil?).to eq false }
    # it { expect(@tournaments['data'][0]['url'].nil?).to eq false }
    # it { expect(@tournaments['data'][0]['content'].nil?).to eq false }
    # it { expect(@tournaments['data'][0]['banner_preview']).to be_a(String) }
    # it { expect(@tournaments['data'][0]['banner_preview'].nil?).to eq false }
    # # it { expect(@tournaments['data'][0]['data_form'].strftime("%Y-%d-%m %H:%M:%S %z")).to eq @time_now}
    # it { expect(@tournaments['data'][0]['count_winners']).to be_a(Integer)}
    #
    # it { expect(@tournaments['data'][0]['count_winners'].to_i > 0).to eq true }
    # it { expect(@tournaments['data'][0]['user_involved']).to eq false }
    # it { expect(@tournaments['data'][0]['users_count']).to be_a(Integer) }
    # it { expect(@tournaments['data'][0]['initial_balance']).to be_a(Integer) }
    # it { expect(@tournaments['data'][0]['participation_fee']).to be_a Integer }
    # it { expect(@tournaments['data'][0]['prize_fund']).to be_a(Integer) }
    # it { expect(@tournaments['data'][0]['timeline_status']).to eq "actual" }
    # it { expect(@tournaments['data'][0]['currency_iso']).to eq nil }
  end


end
