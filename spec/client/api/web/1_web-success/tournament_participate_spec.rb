require 'rails_helper'
include RSpec

  shared_context "variable_configure" do
    let! :ws { RequestWsError.new }
    let! :stage { ENV['stage'] }

    let! :tournaments { Tournaments.new.api("ru", "web") }

    let! :id do
      id = TournamentsIds.where(stage: ENV['stage']).last.tournament_id

      # ids = []
      # ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['tournament_type'] == "sum_deals" }
      # id = ids[0].compact.max
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
    # ids = []
    # # ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru"  }
    # ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['tournament_type'] == "sum_deals" }
    # @id_max = ids[0].compact.max
    @id_max = TournamentsIds.where(stage: ENV['stage']).last.tournament_id

    print "#{@id_max} ".yellow

    email = Cookies.where(stage: "#{ENV['stage']}").last.email
    password = "12345q"

    @partcitipate = Tournaments.new.participate("ru", "web", password, email, @id_max)
    @partcitipants = Tournaments.new.participants("ru", "web", @id_max, password, email)

    list_tournament = Tournaments.new.show("ru", "web", @id_max, password, email)['data']
    list_tournament.map do |key, value|
      @show = key if key['content'] == "Tournaments RU for rspec" && key['id'] == @id_max.to_i
    end.compact.last

  end

  context "params list tournament" do
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
    it { expect(@tournaments['data'][0]['count_winners']).to be_a Integer }

    it { expect(@tournaments['data'][0]['count_winners'].to_i > 0).to eq true }
    it { expect(@tournaments['data'][0]['count_winners'].to_i).to eq 5 }
    it { expect(@tournaments['data'][0]['user_involved']).to eq false }
    it { expect(@tournaments['data'][0]['users_count']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['initial_balance']).to be_a Integer  }
    it { expect(@tournaments['data'][0]['participation_fees']).to be_a Hash }
    it { expect(@tournaments['data'][0]['prize_fund']).to be_a Hash }

    it { expect(@tournaments['data'][0]['timeline_status']).to eq "actual" }
    it { expect(@tournaments['data'][0]['currency_iso']).to eq nil }
  end

# participate user in tournaments id
  context "param parcitpation" do
    it { expect(@partcitipate['success']).to eq true }
    it { expect(@partcitipate['errors']).to eq [] }
  end

# # show list tournamnent id
  context "param parcitpants" do
    it { puts @parcitpants }
    it { expect(@partcitipants['success']).to eq true }
    it { expect(@partcitipants['errors']).to eq [] }

     it { expect(@partcitipants['data']['content']).to eq "Tournaments RU for rspec" }
     it { expect(@partcitipants['data']['banner_content']).to be_a String }
     it { expect(@partcitipants['data']['date_to']).to be_a String }
     it { expect(@partcitipants['data']['date_from']).to be_a String }
     it { expect(@partcitipants['data']['user_involved']).to eq true }
     it { expect(@partcitipants['data']['user_position']).to be_a Integer }
     it { expect(@partcitipants['data']['users_count']).to be_a Integer }
     it { expect(@partcitipants['data']['initial_balance']).to eq 10000 }
     it { expect(@partcitipants['data']['count_winners']).to eq 5 }
     it { expect(@partcitipants['data']['participation_fees']).to eq participation_fees }
     it { expect(@partcitipants['data']['prize_fund']).to eq prize_fund }
     it { expect(@partcitipants['data']['rebuy_fees']).to eq rebuy_fees }
     it { expect(@partcitipants['data']['tournament_type']).to eq "sum_deals" }
     it { expect(@partcitipants['data']['tournament_type']).to be_a String }
     it { expect(@partcitipants['data']['tournament_type_key']).to eq "tournaments.page.sum_deals" }
     it { expect(@partcitipants['data']['trading_account_type']).to eq "tournament_#{@id_max}" }
     it { expect(@partcitipants['data']['timeline_status']).to eq "actual" }
     it { expect(@partcitipants['data']['prizes']).to be_a Array }
     it { expect(@partcitipants['data']['prizes']).to eq prizes }
     it { expect(@partcitipants['data']['currency_iso']).to eq "USD" }
     it { expect(@partcitipants['data']['rebuy']).to eq true }
     it { expect(@partcitipants['data']['rebuy_amount']).to eq 1000 }
     it { expect(@partcitipants['data']['rebuy_max_balance']).to eq 10000 }
     it { expect(@partcitipants['data']['rebuy_fee']).to eq 10000 }
     it { expect(@partcitipants['data']['rebuys_count']).to be_a Integer }
  end

  context "param parcitpants" do
    it { puts @show }
    it { expect(@show['id']).to eq @id_max }
    it { expect(@show['id']).to be_a Integer }
    it { expect(@show['name']).to be_a String }
    it { expect(@show['content']).to be_a String }
    it { expect(@show['banner_preview']).to be_a String }
    it { expect(@show['count_winners']).to be_a Integer }
    it { expect(@show['date_to']).to be_a String }
    it { expect(@show['date_from']).to be_a String }
    it { expect(@show['user_involved']).to eq true }
    it { expect(@show['users_count']).to be_a Integer }

    it { expect(@show['initial_balance']).to eq 10000 }
    it { expect(@show['participation_fees']).to eq participation_fees }
    it { expect(@show['timeline_status']).to eq "actual" }
  end
end
