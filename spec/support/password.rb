def password_current_blank
  [ { "field"=>"current_password", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def password_current_invalid
  [ { "field"=>"current_password", "message"=>"Текущий пароль неверен", "code"=>"password_invalid" } ]
end

def password_change_blank
  [ { "field"=>"new_password", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def password_new_to_short
  [ { "field"=>"new_password",  "message"=>"Не менее 6 символов", "code"=>"too_short" } ]
end

def password_new_blank
  [ { "field"=>"new_password",  "message"=>"Не менее 6 символов", "code"=>"blank" } ]
end

def password_new_empty
  [ { "field"=>"new_password", "message"=>"Должен содержать и буквы, и цифры", "code"=>"invalid" } ]
end

def password_new_confirmation
  [ { "field"=>"new_password_confirmation", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def password_empty_confirmation
  [ { "field"=>"new_password_confirmation", "message"=>"не совпадает со значением поля Новый пароль", "code"=>"confirmation" } ]
end


def pass_confirmation
  [ { "field"=>"password_confirmation", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def pass_empty_confirmation
  [ { "field"=>"password_confirmation", "message"=>"не совпадает со значением поля Пароль", "code"=>"confirmation" } ]
end


def pass_length
  [ { "field"=>"password", "message"=>"Не менее 6 символов", "code"=>"too_short" } ]
end

def pass_blank
  [ { "field"=>"password", "message"=>"Поле обязательно для заполнения", "code"=>"blank" } ]
end

def pass_symbol
  [ { "field"=>"password", "message"=>"Должен содержать и буквы, и цифры", "code"=>"invalid" } ]
end
