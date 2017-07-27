class Binpartner::SmokeBinpartnerController < ApplicationController
  before_action :set_params

  def create
    partner_scenarios = params["generator"]["scenario"]&.map {|f| @config_part[f]}.reject{ |x| x.nil?}
    File.open("./features/created-partner.feature", 'w'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step partner\n Given Pid process\n ")}
    File.open("./features/created-partner.feature", 'a'){|f| f.puts(partner_scenarios.join("\n"))}
    p params["generator"]
  end

  def set_params
    @config_part = YAML.load(File.read("./config/scenarios/scenarios_binpartner.yml"))
  end
end
