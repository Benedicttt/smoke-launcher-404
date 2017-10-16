def add_cookies_to_page(session)
  id = User.where(stage_number: ENV['stage']).last.id
  sleep 0.1
  params_binomo = id.nil? ? JSON.parse(Cookies.last.cookies_traider) : JSON.parse(Cookies.find(id).cookies_traider)
  params_binomo.each_with_index { |k, num| session.manage.add_cookie(name: "#{params_binomo.keys[num]}", value: "#{params_binomo.values[num]}") }
end

def add_cookies_to_page_partner(session)
  id = Partner.where(stage_number: ENV['stage']).last.id
  sleep 0.1
  params_binomo = id.nil? ? JSON.parse(Partner.where(stage_number: ENV['stage']).last.cookies.to_json) : JSON.parse(Partner.where(stage_number: ENV['stage']).last.cookies.to_json)
  params_binomo.each_with_index { |k, num| session.manage.add_cookie(name: "#{params_binomo.keys[num]}", value: "#{params_binomo.values[num]}") }
end
