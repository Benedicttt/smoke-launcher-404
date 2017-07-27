class Homepage::BranchController  < ApplicationController
  before_action :set_params

  def create
    File.open("./features/deploy.feature", 'w+') do |f|
      f.puts("Feature: Deploy #{Time.now}\n")
      f.puts("Scenario: Deploy branch \n")
      f.puts("#{branch_scenario['pid_deploy']}\n")
      f.puts("#{branch_scenario['deploy']}\n")
    end
  end

  def branch_scenario
    @branch_scenario = YAML.load_file(Rails.root.join('./config/scenarios/branch_scenario.yml'))
  end

  def set_params
    @params = YAML.load_file(Rails.root.join('./config/scenarios/branch.yml'))
  end
end
