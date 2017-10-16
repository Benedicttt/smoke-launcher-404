def deals_max_sum
  [ {"field"=>"amount", "message"=> "Максимальная сумма <span class='currency-unit currency-unit-usd'>$</span><span class='currency-amount'>1000.00</span>", "code"=>"deal_amount_max" } ]
end

def deals_expire
  [ {"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_expire_at" } ]
end

def deals_asset
  [ {"field"=>"asset", "message"=>"В данный момент актив недоступен", "code"=>"asset_unavailable" } ]
end

def deals_amount_invalid
  [ {"field"=>"amount", "message"=>"Неверное значение суммы", "code"=>"deal_amount_invalid" } ]
end

def deals_inclusion
  [ {"field"=>"trend", "message"=>"имеет непредусмотренное значение", "code"=>"inclusion" } ]
end

def deals_asset_unavailable
  [ {"field"=>"asset", "message"=>"В данный момент актив недоступен", "code"=>"asset_unavailable" } ]
end
