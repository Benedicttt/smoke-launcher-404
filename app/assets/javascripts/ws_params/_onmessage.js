  function notify_status_testing(params) {
    App.smoke_binomo.send = function(data) {

      if (data.data == "Test aborting"){
          $('.ws label').text("Test aborting, run next test step")
      }

      if (data.data == "Test completed"){
        $('.ws label').text("Test completed").css("color", "green"),
        $('.stop').click()
      };

    };
  };

  function kill_proccess_deploy() {
    w.onmessage = function(data) {
      if (data.data == "Kill pid process deploy"){
        $('.ws label').text("Kill all pid process deploy").css("color", "red")
      }
    }
  };

  function deploy_binpartner() {
    w.onmessage = function(data) {
      if ($('#last-branch').val() == null || $('#last-branch').val() == '') {}
      else {
        if (data.data == "Start deploy Binpartner staging, branch=" + $('#last-branch').val().replace(/ /g, "")) {
          $('.ws label').text("Start deploy Binpartner staging, branch=" +
          $('#last-branch').val().replace(/ /g, "") + " ") .css("color", "yellow")
        }

        if (data.data == "Deploy Binpartner staging done, branch=" + $('#last-branch').val().replace(/ /g, "")){
          $('.ws label').text("Deploy Binpartner staging done, branch=" +
          $('#last-branch').val().replace(/ /g, "")).css("color", "green")
        }
      };
    }

    $('#__written_in_the_log').prop('checked', false)
    $('#__clear_releases').prop('checked', false)
  };

  function deploy_binomo() {
    w.onmessage = function(data) {
      if ($('#first-branch').val() == null || $('#first-branch').val() == '') { }
      else {

        if (data.data == "Start deploy Binomo staging, branch=" + $('#first-branch').val().replace(/ /g, "")) {
          $('.ws label').text("Start deploy Binomo staging, branch=" +
          $('#first-branch').val().replace(/ /g, "") + " ") .css("color", "yellow")

        }

        if (data.data == "Deploy Binomo staging done, branch=" + $('#first-branch').val().replace(/ /g, "")){
          $('.ws label').text("Deploy Binomo staging done, branch=" +
          $('#first-branch').val().replace(/ /g, "")).css("color", "green")
        }
      };
    }

    $('#__written_in_the_log').prop('checked', false)
    $('#__clear_releases').prop('checked', false)
  };

  function change_date_binpartner() {
    w.onmessage = function(data) {
      if (data.data == "Start change new date binpartner " + $('#_binpartner_test_date').val()){
        $('.ws label').text("Start change new date binpartner " +
        $('#_binpartner_test_date').val()) .css("color", "yellow")
      };

      if (data.data == "Binpartner change done " + $('#_binpartner_test_date').val()){
        $('.ws label').text("Binpartner change done " +
        $('#_binpartner_test_date').val()) .css("color", "green"),
        $('.restart_unicorn_last').click()
      }
    }
  };

  function change_date_binomo() {
    w.onmessage = function(data) {
      if (data.data == "Start change new date binomo " + $('#_binomo_test_date').val()){
        $('.ws label').text("Start change new date binomo " +
        $('#_binomo_test_date').val()) .css("color", "yellow")
      }

      if (data.data == "Binomo change done " + $('#_binomo_test_date').val()){
        $('.ws label').text("Binomo change done " +
        $('#_binomo_test_date').val()) .css("color", "green"),
        $('.restart_unicorn_first').click()
      }
    }
  };

  function restart_unicorn() {
    w.onmessage = function(data){
      if (data.data == "Start restart unicorn"){
          $('.ws label').text("Start restart unicorn").css("color", "yellow")
        }
      if (data.data == "Restart unicorn done"){
        $('.ws label').text("Restart unicorn done").css("color", "green")
      }
    }
  };

  function restart_daemons() {
    w.onmessage = function(data) {

      if (data.data == "Start restart daemons"){
          $('.ws label').text("Start restart daemons").css("color", "yellow")
        }

      if (data.data == "Restart daemons done"){
        $('.ws label').text("Restart daemons done").css("color", "green")
      }
    }
  };

  function precomile_assets() {
    w.onmessage = function(data) {
      if (data.data == "Assets precompile start") {
        $('.ws label').text("Assets precompile start").css("color", "yellow")
      }

      if (data.data == "Assets precompile done"){
        $('.ws label').text("Assets precompile done").css("color", "green")
      }
    }
  }
