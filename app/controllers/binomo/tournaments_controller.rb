class Binomo::TournamentsController < ApplicationController
  before_action :set_params

  def create
    binomo = params["generator"]["scenario"]&.map {|f| @binomo[f]}.reject{ |x| x.nil?}

    File.open("./features/tournaments.feature", 'w+') do |f|
      f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")
     end
    File.open("./features/tournaments.feature", 'a') do |f|
      f.puts(binomo.join("\n"))
      f.puts("\nScenario:\tThen Pool ranning?")
    end
    p params["generator"]

  end

  def set_params
    @tournaments = YAML.load_file(Rails.root.join('./config/scenarios/tournaments.yml'))
    @binomo = YAML.load_file(Rails.root.join('./config/scenarios/scenarios_binomo.yml')).merge(@tournaments)
  end
end
