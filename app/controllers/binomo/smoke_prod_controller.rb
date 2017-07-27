class Binomo::SmokeProdController < ApplicationController
  before_action :set_params
  
  def create
    File.open("./features/production.feature", 'w+'){|f| f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")}

    File.open("./features/production.feature", 'a') do |f|
      f.puts "Scenario: External registration form \n"
        f.puts  "\tGiven Current \"Registration\"\n"
        f.puts  "\t\tWhen Data form external registration form\n"
        f.puts  "\t\tThen Treder registration"; f.puts

      # 36 => number count landings!!!!!!!!!!!!!
      36.to_i.times do |i|
        i += 1
        f.puts "Scenario: Smoke testing landings #{i}\n"

        f.puts "\tGiven Change geo RUB #{i}"
          f.puts "\tGiven Current landing #{i}\n"
          f.puts "\t\tWhen Find required items, form registration: or landing #{i}\n"
          f.puts "\t\tWhen Registration form to landing #{i}\n"
          f.puts "\t\t\tThen Registred trader at the landing #{i}\n "
          f.puts "\tWhen Visit landings authorized user #{i}\n"
          f.puts "\t\t\tThen Current url /welcome #{i}"; f.puts

        f.puts "\tGiven Change geo KZT #{i}"
          f.puts "\tGiven Current landing reset #{i}\n"
          f.puts "\t\tWhen Registration form to landing #{i}\n"
          f.puts "\t\t\tThen Registred trader at the landing #{i}\n "
          f.puts "\tWhen Visit landings authorized user #{i}\n"
          f.puts "\t\t\tThen Current url /welcome #{i}"; f.puts
      end

      f.puts "\t\t\tGiven Visit to pages"
      f.puts "\t\t\tWhen Current page and status"
      f.puts "\t\t\tThen Find form Registartion in landings"

      f.puts "Scenario: Smoke testing status_code\n"
      f.puts "\tGiven Visit to pages \n"
      f.puts "\tThen Current page and status\n"; f.puts

    end
    p params["generator"]
  end

  def set_params
    @config = YAML.load_file(Rails.root.join('./config/scenarios/scenarios_binomo.yml'))
  end
end
