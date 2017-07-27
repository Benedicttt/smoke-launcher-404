json.array!(@stat) do |stat|
  json.extract! @stat, :currency, :email, :locale, :geo_locale, :stage_number, :password, :platform, :first_name, :last_name, :created_at, :updated_at, :wire_capital, :ecommpay, :card_pay, :phone_verifed, :document_verifed, :status
end
json.url launcher_stats_path(stat, format: :json)
