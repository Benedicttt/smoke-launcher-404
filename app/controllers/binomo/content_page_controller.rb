class Binomo::ContentPageController < ApplicationController
  before_action :set_params

  def create
    scenarios = params["generator"]["scenario"]&.map {|f| @config[f]}.reject{ |x| x.nil?}
    settings = params["generator"]["scenario"]&.map {|f| @settings[f]}.reject{ |x| x.nil?}
    content = params["generator"]["scenario"]&.map {|f| @content[f]}.reject{ |x| x.nil?}
    faq = params["generator"]["scenario"]&.map {|f| @faq[f]}.reject{ |x| x.nil?}
    sandbox = params["generator"]["scenario"]&.map {|f| @sandbox[f]}.reject{ |x| x.nil?}
    offers = params["generator"]["scenario"]&.map {|f| @offers[f]}.reject{ |x| x.nil?}

    File.open("./features/content-page.feature", 'w+') do |f|
      f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n  ")
    end

    File.open("./features/content-page.feature", 'a') do |f|
      f.puts(scenarios.join(""))
      f.puts(settings.join(""))
      f.puts(content.join(""))
      f.puts(faq.join(""))
      f.puts(sandbox.join(""))
      f.puts(offers.join(""))
    end
    p params["generator"]

  end

  def set_params
    @config   = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))
    @settings = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))['settings']
    @content  = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))['content']
    @faq      = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))['content']['faq']
    @sandbox   = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))['sandbox']
    @offers   = YAML.load_file(Rails.root.join('./config/scenarios/contents.yml'))['offers']
  end
end
