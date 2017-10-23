def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'binomo', :user => 'binomo', :password => 'binomo'
  res = con.exec sql
end
