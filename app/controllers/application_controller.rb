class ApplicationController < ActionController::Base
  before_action  :common_settings, :tariff, :stage_select, :drv, :locale, :framework, :currency, :geo
  protect_from_forgery with: :exception

  def common_settings
    @common_setting = YAML.load_file(Rails.root.join('./config/settings.yml'))
  end

  def tariff
    @tariff = @common_setting["tariff"]
  end

  def stage_select
    @stage_select = @common_setting["stage_select"]
  end

  def drv
    @drv = @common_setting["drivers"].keys
  end

  def locale
    @locale = @common_setting["locale"].keys.map { |i| i.upcase }
  end

  def geo
    @geo = @common_setting["geo"].keys.map { |i| i.upcase }
  end

  def framework
    @framework = @common_setting["frame_work"]
  end

  def currency
    @currency = @common_setting["currency"].values.map { |i| i[1] }
  end
end
