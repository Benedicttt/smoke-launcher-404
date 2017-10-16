def list_currency(cur, authtoken = nil)
  list = data(
    RestClient.get(
      "#{ENV['api_host']}/config", {
         params: {
           authtoken: authtoken,
           locale: 'ru',
           device: 'web',
           geo: "AF" }
     }), 'data')['currencies']['list']

  list.map do |key|
    key if key['iso'] == cur
  end
end

def currency_usd_auth
   {"iso"=>"USD", "unit"=>"$", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[100, 500, 1000, 2000, 5000, 10000, 20000, 100000]} 
end

def currency_eur_auth
   {"iso"=>"EUR", "unit"=>"€", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[100, 500, 1000, 2000, 5000, 10000, 20000, 100000]}
end

def currency_rub_auth
   {"iso"=>"RUB","unit"=>"₽","limits"=> {"min"=>10000,"max"=>5000000},"summs"=>[10000,20000,50000,100000,250000,500000,1000000,5000000]}
end

def currency_cny_auth
   {"iso"=>"CNY","unit"=>"¥","limits" => {"min"=>400,"max"=>2500000},"summs"=>[500,2000,6000,13000,32000,65000,130000]}
end

def currency_try_auth
   {"iso"=>"TRY","unit"=>"₺","limits"=> {"min"=>1000,"max"=>341000},"summs"=>[1800,3500,6900,10000,17100,34100,68200,341000]}
end

def currency_uah_auth
   {"iso"=>"UAH","unit"=>"₴","limits"=> {"min"=>2600,"max"=>2597600},"summs"=>[2600,13000,26000,52000,129900,259800,519600,2597600]}
end

def currency_inr_auth
   {"iso"=>"INR","unit"=>"₹","limits"=> {"min"=>6400,"max"=>6398100},"summs"=>[6400,32000,64000,128000,320000,639900,1279700,6398100]}
end


def currency_usd
  [{"iso"=>"USD", "unit"=>"$", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[10000, 20000, 100000]}]
end

def currency_eur
  [ {"iso"=>"EUR", "unit"=>"€", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[10000, 20000, 100000]} ]
end

def currency_rub
  [ {"iso"=>"RUB", "unit"=>"₽", "limits"=>{"min"=>10000, "max"=>5000000}, "summs"=>[500000, 1000000, 5000000]} ]
end

def currency_cny
  [ {"iso"=>"CNY", "unit"=>"¥", "limits"=>{"min"=>400, "max"=>2500000}, "summs"=>[32000, 65000, 130000]} ]
end

def currency_try
  [ {"iso"=>"TRY", "unit"=>"₺", "limits"=>{"min"=>1000, "max"=>341000}, "summs"=>[34100, 68200, 341000]} ]
end

def currency_uah
  [ {"iso"=>"UAH", "unit"=>"₴", "limits"=>{"min"=>2600, "max"=>2597600}, "summs"=>[259800, 519600, 2597600]} ]
end

def currency_inr
  [ {"iso"=>"INR", "unit"=>"₹", "limits"=>{"min"=>6400, "max"=>6398100}, "summs"=>[639900, 1279700, 6398100]} ]
end



def currency_usd_nil
  [{"iso"=>"USD", "unit"=>"$", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[]}]
end

def currency_eur_nil
  [ {"iso"=>"EUR", "unit"=>"€", "limits"=>{"min"=>100, "max"=>100000}, "summs"=>[]} ]
end

def currency_rub_nil
  [ {"iso"=>"RUB", "unit"=>"₽", "limits"=>{"min"=>10000, "max"=>5000000}, "summs"=>[]} ]
end

def currency_cny_nil
  [ {"iso"=>"CNY", "unit"=>"¥", "limits"=>{"min"=>400, "max"=>2500000}, "summs"=>[]} ]
end

def currency_try_nil
  [ {"iso"=>"TRY", "unit"=>"₺", "limits"=>{"min"=>1000, "max"=>341000}, "summs"=>[]} ]
end

def currency_uah_nil
  [ {"iso"=>"UAH", "unit"=>"₴", "limits"=>{"min"=>2600, "max"=>2597600}, "summs"=>[]} ]
end

def currency_inr_nil
  [ {"iso"=>"INR", "unit"=>"₹", "limits"=>{"min"=>6400, "max"=>6398100}, "summs"=>[]} ]
end
