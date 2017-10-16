def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'launcher_binomo_db', :user => 'benedict', :password => 'folken123'
  res = con.exec sql
end
