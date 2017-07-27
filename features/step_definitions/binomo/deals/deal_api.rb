class DealsApi
  def self.time_expired
    if "#{ENV['binary']}" == "true"
      @expired = (Time.now.to_i / 60).to_i*60
      @expired += Time.now.sec < 30 ? 7.minutes : 6.minutes
      @option_type = "binary"
    end

    if "#{ENV['turbo']}" == "true"
      @expired = (Time.now.to_i / 60).to_i*60
      @expired += Time.now.sec > 30 ? 2.minutes : 1.minutes
      @option_type = "turbo"
    end
  end

  def self.lose
    DealsApi.time_expired
    visit "#{CommonSetting[:app_host]}/api/deals/create?amount=#{ENV['count_deals_sum']}00&asset=GOL/OTC&created_at=#{Time.now.to_i}&expire_at=#{@expired}&demo=#{ENV['type']}&option_type=#{@option_type}&trend=call&source=mouse&locale=#{ENV['locale'].downcase}&device=web"
    sleep ENV['between'].to_i
  end

  def self.win
    DealsApi.time_expired
    visit "#{CommonSetting[:app_host]}/api/deals/create?amount=#{ENV['count_deals_sum']}00&asset=GOL/OTC&created_at=#{Time.now.to_i}&expire_at=#{@expired}&demo=#{ENV['type']}&option_type=#{@option_type}&trend=put&source=mouse&locale=#{ENV['locale'].downcase}&device=web"
    sleep ENV['between'].to_i
  end
end
