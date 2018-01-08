$(function() {
  if ($('.ws_sender').attr('id') == "smoke-binomo") {
    App.smoke_binomo = App.cable.subscriptions.create({
      channel: "SmokeBinomoChannel",
      connected: function() {},
      send_params: function(data) {console.log(data)}
    });
  }
});
