require 'rails_helper'
include RSpec

  shared_context "variable_configure_error" do
    let! :ws { RequestWsError.new }
    let! :stage { ENV['stage'] }

    let! :tournaments { Tournaments.new.api("ru", "web") }

    let! :id do
      # ids = []
      # ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['tournament_type'] == "sum_deals" }
      # id = ids[0].compact.max
      id = TournamentsIds.where(stage: ENV['stage']).last.tournament_id
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
    let :amount_max { [{"validation"=>"deal_amount_max", "field"=>"amount"}] }
    let :amount_balance { [{"validation"=>"deal_amount_balance", "field"=>"amount"}] }
    let :deal_type_trend { [{"validation"=>"inclusion", "field"=>"deal_type"}, {"validation"=>"inclusion", "field"=>"trend"}] }
    let :finished { [{"validation"=>"finished", "field"=>"tournament"}] }
    let :trend { [{"validation"=>"inclusion", "field"=>"trend"}] }
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournament", "put", 1, nil , stage, 1
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq required }
    end
  end


  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournamen", "pu", 1, id + 1, stage, 3
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq deal_type_trend }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 0, "turbo", "tournament", "put", 1, id, stage, 5
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq amount }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OT", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 6
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq asset }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", true, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 7
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq amount }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "we", false, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id, stage, 8
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq nil }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournament", "pu", 1, id, stage, 9
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq trend }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", true, "GOL/OTC", expire_at, 10000000, "turbo", "tournament", "put", 1, id, stage, 10
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq amount_max }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 1000, "turbo", "ournament", "put", 1, id, stage, 11
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq inclusion }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure_error"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", "", 10000, "turbo", "tournament", "put", 1, id, stage, 12
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq expire_at_error }
    end
  end
