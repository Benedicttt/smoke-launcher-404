def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'binomo', :host => "127.0.0.1"
  res = con.exec sql
end
