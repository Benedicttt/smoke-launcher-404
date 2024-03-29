$(function() {
  if ($('.ws_sender_binpartner').attr('id') == "deploy-project-binpartner") {
    App.deploy_binpartner_channel = App.cable.subscriptions.create( "DeployBinpartnerChannel", {

      connected: function() {
        $('.ws label').text("WebSocket connect").css("color", "yellow");
        $('.reload-page').click(function(){window.location.reload(true);})
      },

      disconnected: function() {
        $('.ws label').text("WebSocket disconnected").css("color", "red");
      },


      received: function() {
        branch_handler_binpartner_start("Start")
        branch_handler_binpartner_done("Complete")

        function_handler_start("Start change date")
        function_handler_done("Done change date")

        function_handler_start("Start command memcached:flush")
        function_handler_done("Done command memcached:flush")

        function_handler_start("Start daemons:restart")
        function_handler_done("Done daemons:restart")

        function_handler_start("Start assets:precompile")
        function_handler_done("Done assets:precompile")

        function_handler_start("Start unicorn:restart")
        function_handler_done("Done unicorn:restart")

        function_handler_start("Start unicorn:restart")
        function_handler_done("Done unicorn:restart")

        function_start_stop("Start KILL ALL PROCCESS")
        function_stop_stop("Done KILL ALL PROCCESS")

    }
  })


    $('.pid_process_deploy').click(function() {
      App.deploy_binpartner_channel.send(JSON.stringify({
        pid_deploy: "pid_deploy"
      }))
  })};

    $('.ws_sender_binpartner').click(function(){
      if (str= '', $('#deploy-project-binpartner').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#last-binpartner').val() + " deploy project=" +
        $('#last-project').val() + " branch=" +
        $('#last-branch').val().replace(/ /g, "")
      )};

      App.deploy_binpartner_channel.send(JSON.stringify({
        clear_releases: $('#__clear_releases').prop('checked'),
        binpartner_deploy: "binpartner_deploy",
        count_deploy: $('#_global_link').val(),
        write_log : $('#__written_in_the_log').prop('checked')
      }));
    });

    $('.change_test_date_binpartner').click(function(){
      App.deploy_binpartner_channel.send(JSON.stringify({
        count_date_new_binpartner: $('#_binpartner_test_date').val(),
        count_deploy: $('#_global_link').val(),
        change_new_binpartner: "test_date_new_binpartner"
      }));

    });

    $('.ws_sender_binpartner_clean_debug').click(function(){
      if (str= '', $('#deploy-project-binpartner-clean-debug').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#last-binpartner').val() + " deploy project=" +
        $('#last-project').val() + " branch=" +
        $('#last-branch').val().replace(/ /g, "") + " clean=1 debug=1"
      )}

      $(".start").click();
        App.deploy_binpartner_channel.send(JSON.stringify({
          clear_releases: $('#__clear_releases').prop('checked'),
          binpartner_deploy_clean_debug: "binpartner_deploy_clean_debug",
          count_deploy: $('#_global_link').val(),
          write_log : $('#__written_in_the_log').prop('checked')
        }));
    })

    $('.ws_sender_binpartner_clean').click(function(){
      if (str= '', $('#deploy-project-binpartner-clean').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#last-binpartner').val() + " deploy project=" +
        $('#last-project').val() + " branch=" +
        $('#last-branch').val().replace(/ /g, "") + " clean=1"
      )}
      $(".start").click();
        App.deploy_binpartner_channel.send(JSON.stringify({
          clear_releases: $('#__clear_releases').prop('checked'),
          binpartner_deploy_clean: "binpartner_deploy_clean",
          count_deploy: $('#_global_link').val(),
          write_log : $('#__written_in_the_log').prop('checked')
      }));
    })

    $('.memcached_flush_last').click(function(){
      if (str= '', $('.memcached_flush_last').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#last-binpartner').val() + " memcached:flush" + " project=" +
        $('#last-project').val()
      )}

      App.deploy_binpartner_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        memcached: "memcached"
      }));

    });

    $('.assets_precompile_last').click(function(){
      if (str= '', $('.assets_precompile_last').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#last-binpartner').val() + " deploy:assets:precompile" + " project=" +
        $('#last-project').val()
      )}

      App.deploy_binpartner_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        assets: "precompile"
      }));

    });

    $('.restart_daemons_last').click(function(){
      if (str= '', $('.restart_daemons_last').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#last-binpartner').val() + " project=" +
        $('#last-project').val() + " daemons:stop"
        + " && " + "cap" + " " +
        $('#last-binpartner').val() + " project=" +
        $('#last-project').val() + " daemons:start"
      )}

      App.deploy_binpartner_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        restart: "daemons"
      }));

    });

    $('.restart_unicorn_last').click(function(){
      if (str= '', $('.restart_unicorn_last').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#last-binpartner').val() + " project=" +
        $('#last-project').val() + " unicorn:stop" + " && " + "cap" + " " +
        $('#last-binpartner').val() + " project=" +
        $('#last-project').val() + " unicorn:start"
      )}


      App.deploy_binpartner_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        restart: "unicorn"
      }));
    });

  });
