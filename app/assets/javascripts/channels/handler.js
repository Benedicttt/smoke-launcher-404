  function branch_handler_binomo_start(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text("Start deploy Binomo " + $("#first-binomo").val() + ", branch=" +
        $('#first-branch').val().replace(/ /g, "") + " ") .css("color", "yellow")
      }
  }

  function branch_handler_binomo_done(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text("Done deploy Binomo " + $("#first-binomo").val() + ", branch=" +
        $('#first-branch').val().replace(/ /g, "") + " ") .css("color", "green")
      }
  }

  function branch_handler_binpartner_start(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text("Start deploy Binparter " + $("#last-binpartner").val() + ", branch=" +
        $('#last-branch').val().replace(/ /g, "") + " ") .css("color", "yellow")
      }
  }

  function branch_handler_binpartner_done(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text("Done deploy Binparter " + $("#last-binpartner").val() + ", branch=" +
        $('#last-branch').val().replace(/ /g, "") + " ") .css("color", "green")
      }
  }

  function function_handler_start(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "yellow")
      }
  }

  function function_handler_done(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "green")
      }
  }

  function function_start_stop(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "red")
      }
  }

  function function_stop_stop(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "red")
      }
  }
