class Binomo::SmokeBinomoController < ApplicationController
  before_action :set_params, :coupons

  def create
    scenarios = params["generator"]["scenario"]&.map { |f| @config[f] }.compact
    coupons = params["generator"]["scenario"]&.map { |f| @coupons[f] }.compact
    coupons_individual = params["generator"]["scenario"]&.map { |f| @coupons['template individual coupon'][f] }.compact
    coupons_auto = params["generator"]["scenario"]&.map { |f| @coupons['template auto coupon'][f] }.compact
    coupons_common = params["generator"]["scenario"]&.map { |f| @coupons['template common'][f] }.compact
    coupons_filter = params["generator"]["scenario"]&.map { |f| @coupons['coupons'][f] }.compact
    coupons_user = params["generator"]["scenario"]&.map { |f| @coupons['coupons']['user coupons'][f] }.compact

    File.open("./features/smoke-binomo.feature", 'w+'){|f| }
    File.open("./features/smoke-binomo.feature", 'a') do |f|
       f.puts("Feature: SMoke test generate #{Time.now}\n Scenario: Run step\n Given Pid process\n")
       f.puts(scenarios.join(""))
       f.puts(coupons_filter.join("\n"))
       f.puts(coupons_individual.join("\n"))
       f.puts(coupons_common.join("\n"))
       f.puts(coupons_auto.join("\n"))
       f.puts(coupons_user.join("\n"))
       f.puts("\nScenario:\tThen Pool ranning?")
    end

  end

  def set_params
    @config = YAML.load(File.read("./config/scenarios/scenarios_binomo.yml"))
  end
  def coupons
    @coupons =YAML.load(File.read('./config/scenarios/coupons.yml'))
  end
end
