def locale
  [ { "field" => "locale", "message" => "Неверное значение","code" => "not_supported" } ]
end

def blank
  [ { "field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def device
  [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid" } ]
end

def country
  [ { "field"=>"country", "message"=>"Ошибки валидации", "code"=>"invalid" } ]
end

def agree
  [ { "field"=>"i_agree", "message"=>"Вы должны согласиться с правилами","code"=>"blank" } ]
end

def email
  [ { "field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank" } ]
end

def email_empty
  [ { "field"=>"email", "message"=>"Вы не ввели e-mail", "code"=>"blank" } ]
end

def email_invalid
  [ { "field"=>"email", "message"=>"Некорректный e-mail", "code"=>"invalid" } ]
end

def email_not_exist
  [{"field"=>"email", "message"=>"Указанный адрес не зарегистрирован в системе", "code"=>"email_not_exist"} ]
end

def email_created
  [ { "field"=>"email", "message"=>"Указанный адрес уже зарегистрирован", "code"=>"taken" } ]
end

def signature_server
  [ { "field"=>"signature", "message"=>"Ошибки валидации", "code"=>"invalid" } ]
end

def ip_blank
  [ { "field"=>"ip", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def wrong_credentials
  [ { "field"=>"sign_in", "message"=>"Логин или пароль введены неверно", "code"=>"wrong_credentials" } ]
end

def currency_invalid
  [ { "field"=>"currency", "message"=>"Ошибки валидации", "code"=>"invalid" } ]
end

def token_invalid
  [ { "field"=>"token", "message"=>"Ссылка в письме устарела. Восстановите пароль заново.", "code"=>"token_invalid" } ]
end

def not_authorize
  [ {"field"=>"autorization", "message"=>"Не авторизован", "code"=>"unauthorized" } ]
end

def nickname_length
  [ { "field"=>"nickname", "message"=>"Не менее 3 символов", "code"=>"too_short" } ]
end

def last_name_length
  [ { "field"=>"last_name", "message"=>"Не менее 2 символов", "code"=>"too_short" } ]
end
