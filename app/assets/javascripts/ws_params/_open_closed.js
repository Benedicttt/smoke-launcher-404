$(function(){
  w.onopen = function(){ $('.ws label').text("IP " + App.config.ip + " WebSocket connect ").css("color", "yellow")}
  w.onclose = function(){ $('.ws label').css("color", "red").text("IP " + App.config.ip +  " WebSocket close ")}
})
