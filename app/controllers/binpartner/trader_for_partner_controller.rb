class Binpartner::TraderForPartnerController < ApplicationController
  before_action :set_params, :partner_id, :refcode

  def create
    partner_scenarios = params["generator"]["scenario"]&.map {|f| @config_part[f]}.reject{ |x| x.nil?}
    File.open("./features/binpartner-treder.feature", 'w'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step partner\n Given Pid process\n ")}
    File.open("./features/binpartner-treder.feature", 'a'){|f| f.puts(partner_scenarios.join("\n"))}
    p params["generator"]
  end

  def refcode
    @refcode = Partner.last.refcode
  end

  def partner_id
    @partner_id = Partner.last.id
  end

  def set_params
    @config_part = YAML.load_file(Rails.root.join('./config/scenarios/scenarios_binpartner.yml'))
  end
end
