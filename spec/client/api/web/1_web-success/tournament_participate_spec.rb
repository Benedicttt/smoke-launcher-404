require 'rails_helper'
require 'rails_helper'
include RSpec
  
  shared_context "variable_configure" do
    let! :ws { RequestWsError.new }
    let! :stage { ENV['stage'] }

    let! :tournaments { Tournaments.new.api("ru", "web") }

    let! :id do
      ids = []
      ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru" }
      id = ids[0].compact.max
    end

    let! :expire_at do
      expire_at  =  (Time.now.to_i / 60).to_i * 60
      expire_at  += Time.now.sec > 10 ? 2.minutes : 1.minutes
    end

    let :required { [{"validation"=>"required", "field"=>"tournament_id"}] }
    let :blank { [{"validation"=>"blank", "field"=>"tournament_user"}] }
    let :inclusion { [{"validation"=>"inclusion", "field"=>"deal_type"}] }
    let :asset { [{"validation"=>"inclusion", "field"=>"asset"}] }
    let :not_started { [{"validation"=>"not_started", "field"=>"tournament"}] }
    let :expire_at_error { [{"validation"=>"required", "field"=>"expire_at"}] }
    let :amount { [{"validation"=>"deal_amount_min", "field"=>"amount"}] }
    let :deal_type_trend { [{"validation"=>"inclusion", "field"=>"deal_type"}, {"validation"=>"inclusion", "field"=>"trend"}] }
    let :finished { [{"validation"=>"finished", "field"=>"tournament"}] }
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournament", "put", 1, nil , stage, 1
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq required }
    end
  end


  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournamen", "pu", 1, id, stage, 3
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq deal_type_trend }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turb", "tournament", "put", 1, id, stage, 4
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 0, "turbo", "tournament", "put", 1, id, stage, 5
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OT", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 6
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq asset }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", true, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 7
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "we", false, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 8
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq nil }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, id, stage, 9
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, id, stage, 10
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, id, stage, 11
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", "", 10000, "turbo", "tournament", "put", 1, id, stage, 12
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq expire_at_error }
    end
  end

RSpec.describe "Api tournaments success" do
  before(:context) do
    @tournaments = Tournaments.new.api("ru", "web")
    ids = []
    ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru"  }
    @id_max = ids[0].compact.max
    print "#{@id_max} ".yellow

    email = Cookies.where(stage: "#{ENV['stage']}").last.email
    password = "12345q"
    @partcitipate = Tournaments.new.participate("ru", "web", password, email, @id_max)
    @partcitipants = Tournaments.new.participants("ru", "web", @id_max)
    @show = Tournaments.new.show("ru", "web", @id_max)

  end

  context "params list" do
    it { expect(@tournaments['success']).to eq true }
    it { expect(@tournaments['errors']).to eq [] }
    it { expect(@tournaments['data'].class).to eq Array }
    it { expect(@tournaments['data'][0]['id']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['name']).to be_a String  }
    it { expect(@tournaments['data'][0]['content']).to be_a(String) }
    it { expect(@tournaments['data'][0]['name'].nil?).to eq false }
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
