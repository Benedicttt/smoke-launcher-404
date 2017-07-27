class Homepage::ApiRequestController < ApplicationController
  before_action :set_params
  
  def create
    scenarios = params["generator"]["api_select"]&.map {|f| @config_api[f]}.reject{ |x| x.nil?}
    File.open("./features/generate.feature", 'w'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step \n Given Pid process\n")}
    File.open("./features/generate.feature", 'a'){|f| f.puts(scenarios.join("\n"))}
    p params["generator"]

    quality = params["generator"]["api_select"]&.map {|f| @quality[f]}.reject{ |x| x.nil?}
    File.open("./features/quality_reg_api.feature", 'w'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step \n Given Pid process\n")}
    File.open("./features/quality_reg_api.feature", 'a'){|f| f.puts(quality.join("\n"))}
    end

  def set_params
    @quality = YAML.load_file(Rails.root.join('./config/scenarios/reg_quality.yml'))
    @config_api = YAML.load_file(Rails.root.join('./config/scenarios/scenarios_api.yml'))
  end
end
