class Homepage::StatusCodePagesController < ApplicationController
  before_action :set_params

  def create
    scenarios_binomo = params["generator"]["scenario"]&.map {|f| @config_binomo[f]}.reject{ |x| x.nil?}
    File.open("./features/smoke-status-code.feature", 'w+'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")}
    File.open("./features/smoke-status-code.feature", 'a') do |f|
      f.puts(scenarios_binomo.join("\n"))
      f.puts("\nScenario:\tThen Pool ranning?\nGiven Pool ranning?")
    end

    p params["generator"]
  end

  def set_params
    @config_binomo = YAML.load_file(Rails.root.join('./config/scenarios/status_code.yml'))
  end
end
