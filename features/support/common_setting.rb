require 'rails'

class CommonSetting
  $STAGES = %i[crm_login app_host url_adm_partner email email_name email_partner url_partner url_page_crm url_user_crm]
  $LOCALES = %i[locale]
  $CUR = %i[currency deal deposit payment]
  $DRIVER = %i[drivers]
  $TARIFF = %i[t]
  $COUNT_REG = %i[t]
  $FIRST_N = %i[t]
  $LAST_N = %i[t]
  $SLEEP = %i[t]
  $CASHIER = %i[t]
  $CASHIER_DEP = %i[t]
  $DEALS = %i[t]
  $DEALS_SUM = %i[t]
  $PAYOUTS = %i[t]
  $COUNT_PAYOUTS = %i[t]
  $COMMENTS = %i[t]
  $TICKETS = %i[t]
  $PAY_APPROVE = %i[t]
  $PAY_REJECT = %i[t]
  $YOPMAIL = %i[t]
  $CRM_VERIFIED = %i[t]
  $MOBILE = %i[t]
  $BONUS_DEP = %i[t]
  $REG_API_COUNT = %i[t]
  $BETWEEN = %i[t]
  $PARAMS_I = %i[t]
  $CLASS_DOM = %i[t]

  def self.[](key)
    env = if $STAGES.include?(key)
            ENV["stage"]
          elsif $TARIFF.include?(key)
            ENV["tariff"]
          elsif $LOCALES.include?(key)
            ENV["locale"]
          elsif $CUR.include?(key)
            ENV["cur"]
          elsif $DRIVER.include?(key)
            ENV["driver"]
          elsif $COUNT_REG.include?(key)
            ENV["count_reg"].to_s
          elsif $FIRST_N.include?(key)
            ENV["first_n"]
          elsif $LAST_N.include?(key)
            ENV["last_n"]
          elsif $CASHIER.include?(key)
            ENV["cashier"]
          elsif $CASHIER_DEP.include?(key)
            ENV["cashier_dep"]
          elsif $PAYOUTS.include?(key)
            ENV["payouts"]
          elsif $COUNT_PAYOUTS.include?(key)
            ENV["count_payouts"]
          elsif $DEALS.include?(key)
            ENV["deals"]
          elsif $DEALS_SUM.include?(key)
            ENV["deal_sum"]
          elsif $COMMENTS.include?(key)
            ENV["comments"]
          elsif $TICKETS.include?(key)
            ENV["tickets"]
          elsif $PAY_APPROVE.include?(key)
            ENV["pay_approve"]
          elsif $PAY_REJECT.include?(key)
            ENV["pay_reject"]
          elsif $SLEEP.include?(key)
            ENV["count_sleep"]
          elsif $YOPMAIL.include?(key)
            ENV["yopmail"]
          elsif $CRM_VERIFIED.include?(key)
            ENV["crm_verified"]
          elsif $MOBILE.include?(key)
            ENV["platform"]
          elsif $BONUS_DEP.include?(key)
            ENV["bonus_dep"]
          elsif $REG_API_COUNT.include?(key)
            ENV["reg_api_count"]
          elsif $BETWEEN.include?(key)
            ENV["between"]
          elsif $PARAMS_I.include?(key)
            ENV['params_i']
          end

    if key == :email || key == :email_partner
      SecureRandom.hex(8)
    elsif env
      config[key][env]
    else
      config[key]
    end

  end

  def self.config
    @config ||= YAML.load_file('./config/settings.yml').symbolize_keys
  end
end
