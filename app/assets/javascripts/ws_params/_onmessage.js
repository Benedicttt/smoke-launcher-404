$(function() {
  if (App.config.ip != "0.0.0.0")
    $('.ws label').text("IP " + App.config.ip + " WebSocket connect ").css("color", "yellow");
  })

  // function restart_unicorn() {
  //   w.onmessage = function(data){
  //     if (data.data == "Start restart unicorn"){
  //         $('.ws label').text("Start restart unicorn").css("color", "yellow")
  //       }
  //     if (data.data == "Restart unicorn done"){
  //       $('.ws label').text("Restart unicorn done").css("color", "green")
  //     }
  //   }
  // };
  //
  // function restart_daemons() {
  //   w.onmessage = function(data) {
  //
  //     if (data.data == "Start restart daemons"){
  //         $('.ws label').text("Start restart daemons").css("color", "yellow")
  //       }
  //
  //     if (data.data == "Restart daemons done"){
  //       $('.ws label').text("Restart daemons done").css("color", "green")
  //     }
  //   }
  // };
  //
  // function precomile_assets() {
  //   w.onmessage = function(data) {
  //     if (data.data == "Assets precompile start") {
  //       $('.ws label').text("Assets precompile start").css("color", "yellow")
  //     }
  //
  //     if (data.data == "Assets precompile done"){
  //       $('.ws label').text("Assets precompile done").css("color", "green")
  //     }
  //   }
  // }
