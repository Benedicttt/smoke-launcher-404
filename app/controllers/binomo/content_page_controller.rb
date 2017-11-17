class Binomo::ContentPageController < ApplicationController
  before_action :set_params

  def index
  end

  def create
    scenarios = params["generator"]["scenario"]&.map {|f| @config[f]}.reject{ |x| x.nil?}
    File.open("./features/content-page.feature", 'w+'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")}
    File.open("./features/content-page.feature", 'a'){|f| f.puts(scenarios.join("\n"))}
    p params["generator"]
  end

  def set_params
    @config = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))
  end
end
