def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'launcher_binomo_db', :user => 'binomo', :password => 'binomo'
  res = con.exec sql
end
