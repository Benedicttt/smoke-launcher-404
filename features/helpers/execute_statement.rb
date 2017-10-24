def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'binomo', :hot => "127.0.0.1"
  res = con.exec sql
end
