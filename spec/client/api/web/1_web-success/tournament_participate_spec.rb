require 'rails_helper'

RSpec.describe "Api tournaments success" do
  before(:context) do
    @tournaments = Tournaments.new.api("ru", "web")
    ids = []
    ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" }
    @id_max = ids[0].compact.max
    print "#{$id_max} ".yellow

    email = Cookies.where(stage: "#{ENV['stage']}").last.email
    password = "12345q"
    @partcitipate = Tournaments.new.participate("ru", "web", password, email, @id_max)
    @partcitipants = Tournaments.new.participants("ru", "web", @id_max)
    @show = Tournaments.new.show("ru", "web", @id_max)

  end

  context "params list" do
    it { @tournaments['data'].each { |k, v| k['id'] if k['timeline_status'] == "actual" } }
    it { expect(@tournaments['success']).to eq true }
    it { expect(@tournaments['errors']).to eq [] }
    it { expect(@tournaments['data'].class).to eq Array }
    it { expect(@tournaments['data'][0]['id']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['name']).to be_a String  }
    it { expect(@tournaments['data'][0]['url']).to be_a String  }
    it { expect(@tournaments['data'][0]['content']).to be_a(String) }
    it { expect(@tournaments['data'][0]['name'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['url'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['content'].nil?).to eq false }
    it { expect(@tournaments['data'][0]['banner_preview']).to be_a String }
    it { expect(@tournaments['data'][0]['banner_preview'].nil?).to eq false }
    # it { expect(@tournaments['data'][0]['data_form'].strftime("%Y-%d-%m %H:%M:%S %z")).to eq @time_now}
    it { expect(@tournaments['data'][0]['count_winners']).to be_a Integer }

    it { expect(@tournaments['data'][0]['count_winners'].to_i > 0).to eq true }
    it { expect(@tournaments['data'][0]['user_involved']).to eq false }
    it { expect(@tournaments['data'][0]['users_count']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['initial_balance']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['participation_fee']).to be_a Integer }
    it { expect(@tournaments['data'][0]['prize_fund']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['timeline_status']).to eq "actual" }
    it { expect(@tournaments['data'][0]['currency_iso']).to eq nil }
  end

  context "param parcitpation" do
    it { expect(@partcitipate['success']).to eq true }
    it { expect(@partcitipate['errors']).to eq [] }
  end

  context "param parcitpants" do
    it { expect(@partcitipants['success']).to eq true }
    it { expect(@partcitipants['errors']).to eq [] }
    it { expect(@partcitipants['data'][0]['id']).to be_a Integer }
    it { expect(@partcitipants['data'][0]['username']).to be_a String }
    it { expect(@partcitipants['data'][0]['current_user']).to eq false}
    it { expect(@partcitipants['data'][0]['winner']).to eq true }
    it { expect(@partcitipants['data'][0]['position']).to eq 1 }
    it { expect(@partcitipants['data'][0]['vaule']).to eq nil }
  end

  context "param parcitpants" do
    it { expect(@show['success']).to eq true }
    it { expect(@show['errors']).to eq [] }
    it { expect(@show['data']['id']).to eq @id_max }
    it { expect(@show['data']['id']).to be_a Integer }
    it { expect(@show['data']['name']).to be_a String }
    it { expect(@show['data']['content']).to be_a String }
    it { expect(@show['data']['banner_content']).to be_a String }
    it { expect(@show['data']['count_winners']).to be_a Integer }
    it { expect(@show['data']['initial_balance']).to be_a Integer }
    it { expect(@show['data']['participation_fee']).to be_a Integer }
    it { expect(@show['data']['user_involved']).to eq false }
    it { expect(@show['data']['users_count']).to be_a Integer }
    it { expect(@show['data']['prize_fund']).to be_a Integer }
    it { expect(@show['data']['tournament_type']).to be_a String }
    it { expect(@show['data']['tournament_type_key']).to be_a String }
    it { expect(@show['data']['timeline_status']).to eq "actual" }
    it { expect(@show['data']['prizes'][0]['position']).to eq 1 }
    it { expect(@show['data']['prizes'][0]['amount']).to be_a Integer }
    it { expect(@show['data']['currency_iso']).to eq nil }
    it { expect(@show['data']['trading_account_type']).to be_a String }
    it { expect(@show['data']['rebuy']).to be_in [ true, false ] }
    it { expect(@show['data']['rebuy_amount']).to be_a Integer }
    it { expect(@show['data']['rebuy_max_balance']).to be_a Integer }
    it { expect(@show['data']['rebuy_fee']).to be_a Integer }
  end
end
