
  function branch_stages(number) {
   $("#" + number).click(function() {
     $("#" + number + "-binomo, #" + number + "-binpartner")
        .text("Expected")
        .css("color", "red").css("font-size", 16)

      App.branch_binomo.send(JSON.stringify({
        stage: $("#" + number).text()
      }))
     })
   }

   function received_param(stage) {
     stage_number = $.parseJSON(event.data)['message']['stage']
     branch = $.parseJSON(event.data)['message']['data']
     platform = $.parseJSON(event.data)['message']['title']
     author = $.parseJSON(event.data)['message']['author']

    if (stage_number == stage && platform == "binomo") {
      $("#" + stage + "-binomo")
        .text(branch).css("color", "white")
        .css("font-size", 16)
    }

    if (stage_number == stage && platform == "binpartner") {
      $("#" + stage + "-binpartner")
        .text(branch).css("color", "white")
        .css("font-size", 16)
    }

    if (stage_number == stage) {
      $("#author-re-deploy-" + stage)
        .text(author).css("color", "white")
    }

  }

  function branch_stages_all(number) {
     $("#" + number + "-binomo, #" + number + "-binpartner, " + "#author-re-deploy-" + number)
       .text("Expected")
       .css("color", "white")
       .css("font-size", 16)

      App.branch_binomo.send(JSON.stringify({
        stage: $("#" + number).text()
      }))
   }

   function small_click_all() {
      $.each(
        ["s1", "s2", "s3", "s4", "s5", "s6", "s7"],
        function(index, value) { branch_stages_all(value)
     })
   }
