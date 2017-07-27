$(function(){
  w.onopen = function(){ $('.ws label').text(" WebSocket connect ").css("color", "yellow")}
  w.onclose = function(){ $('.ws label').css("color", "red").text(" WebSocket close ")}
})
