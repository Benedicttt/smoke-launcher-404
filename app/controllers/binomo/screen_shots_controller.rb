class Binomo::ScreenShotsController < ApplicationController
  before_action :set_params

  def create
    scenarios = params["generator"]["scenario"]&.map {|f| @config[f]}.reject{ |x| x.nil?}
    File.open("./features/screen-shots.feature", 'w+'){|f| f.puts("Feature: Screen shot scenario generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")}
    File.open("./features/screen-shots.feature", 'a'){|f| f.puts(scenarios.join("\n"))}
    p params["generator"]
  end

  def set_params
    @config = YAML.load_file(Rails.root.join('./config/scenarios/screen_shots_binomo.yml'))
  end
end
