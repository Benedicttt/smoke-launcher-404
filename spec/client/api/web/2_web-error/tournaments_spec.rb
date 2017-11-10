require 'rails_helper'
include RSpec

  shared_context "variable_configure" do
    let :ws { RequestWsError.new }
    let :stage { ENV['stage'] }

    let :tournaments { Tournaments.new.api("ru", "web") }

    let :id do
      ids = []
      ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" }
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
    let :expire_at_error { [{"validation"=>"cast", "type"=>"integer", "field"=>"expire_at"}] }
    let :topic { {"reason"=>"unmatched topic"} }
  end
  #
  # describe "Api tournaments error" do
  #   include_context "variable_configure"
  #   before do
  #     deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournament", "put", 1, "" , stage
  #   end
  #
  #   context "response to error tournaments id " do
  #     it { expect($result['payload']['status']).to eq 'error' }
  #     it { expect($result['payload']['response']['reasons']).to eq required }
  #   end
  # end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournament", "put", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['status']).to eq 'error' }
      it { expect($result['payload']['response']).to eq topic }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turbo", "tournamen", "pu", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']).to eq topic }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 100, "turb", "tournament", "put", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 0, "turbo", "tournament", "put", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OT", expire_at, 10, "turbo", "tournament", "put", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq asset }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", true, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "we", false, "GOL/OTC", expire_at, 10, "turbo", "tournament", "put", 1, id - 1, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq nil }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, id - 1, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq blank }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, id + 1, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq not_started }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", expire_at, 10000, "turbo", "tournament", "put", 1, nil, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq required }
    end
  end

  describe "Api tournaments error" do
    include_context "variable_configure"
    before do
      deal_creat = ws.send_ws "web", false, "GOL/OTC", "", 10000, "turbo", "tournament", "put", 1, nil, stage
    end

    context "response to error tournaments id " do
      it { expect($result['payload']['response']['reasons']).to eq expire_at_error }
    end
  end
