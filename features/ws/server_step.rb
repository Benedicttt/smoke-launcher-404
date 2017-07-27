require './features/ws/ws'
  Given /^Ws and rails server$/ do
      thr=[]
      thr << Thread.new{WS.server}
      thr.each{|thr| thr.join}
  end
