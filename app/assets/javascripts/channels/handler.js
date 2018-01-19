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
        $('.stop').click()
      }
  }

  function function_start_stop(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "yellow")
      }
  }

  function function_stop_stop(data) {
      if ($.parseJSON(event.data)['message'] == data) {
        $('.ws label').text(data).css("color", "red")
      }
  }

  function branch_stages(number) {
   $("#" + number).click(function() {
     $("#" + number + "-binomo, #" + number + "-binpartner").text("Expected").css("color", "red").css("font-size", 16)

      App.branch_binomo.send(JSON.stringify({
        stage: $("#" + number).text()
      }))
     })
   }

   function received_param(stage) {
     stage_number = $.parseJSON(event.data)['message']['stage']
     branch = $.parseJSON(event.data)['message']['data']
     platform = $.parseJSON(event.data)['message']['title']

     if (stage_number == stage && platform == "binomo") {
       $("#" + stage + "-binomo").text(branch).css("color", "green").css("font-size", 16)
    }

    if (stage_number == stage && platform == "binpartner") {
      $("#" + stage + "-binpartner").text(branch).css("color", "green").css("font-size", 16)
    }
  }

  function branch_stages_all(number) {
     $("#" + number + "-binomo, #" + number + "-binpartner").text("Expected").css("color", "red").css("font-size", 16)
      App.branch_binomo.send(JSON.stringify({
        stage: $("#" + number).text()
      }))
   }

   function small_click_all() { $.each(["s1", "s2", "s3", "s4", "s5", "s6", "s7"],
      function(index, value) { branch_stages_all(value)
     })
   }
