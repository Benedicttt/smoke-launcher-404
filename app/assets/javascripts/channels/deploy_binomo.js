$(function() {
  if ($('.ws_sender_binomo').attr('id') == "deploy-project-binomo") {
    App.deploy_binomo_channel = App.cable.subscriptions.create( "DeployBinomoChannel",
    {

      connected: function() {},
      disconnected: function() {},

      received: function() {
        branch_handler_binomo_start("Start")
        branch_handler_binomo_done("Complete")

        branch_handler_binomo_start("Start change date")
        branch_handler_binomo_done("Done change date")

        function_handler_start("Start command memcached:flush")
        function_handler_done("Done command memcached:flush")

        function_handler_start("Start daemons:restart")
        function_handler_done("Done daemons:restart")

        function_handler_start("Start assets:precompile")
        function_handler_done("Done assets:precompile")

        function_handler_start("Start unicorn:restart")
        function_handler_done("Done unicorn:restart")

      }

    })

    $('.pid_process_deploy').click(function(){
      App.deploy_binomo_channel.send(JSON.stringify({
        pid_deploy: "pid_deploy"
      }))
    });
  }

    $('.ws_sender_binomo').click(function(){
      if (str= '', $('#deploy-project-binomo').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#first-binomo').val() + " deploy project=" +
        $('#first-project').val() + " branch=" +
        $('#first-branch').val().replace(/ /g, "")
      )};

      App.deploy_binomo_channel.send(JSON.stringify({
        clear_releases: $('#__clear_releases').prop('checked'),
        binomo_deploy: "binomo_deploy",
        count_deploy: $('#_global_link').val(),
        write_log : $('#__written_in_the_log').prop('checked')
      }));
    });

    $('.change_test_date_binomo').click(function(){
      App.deploy_binomo_channel.send(JSON.stringify({
        count_date_new_binomo: $('#_binomo_test_date').val(),
        count_deploy: $('#_global_link').val(),
        change_new_binomo: "test_date_new_binomo"
      }));

    });

    $('.ws_sender_binomo_clean_debug').click(function(){
      if (str= '', $('#deploy-project-binomo-clean-debug').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#first-binomo').val() + " deploy project=" +
        $('#first-project').val() + " branch=" +
        $('#first-branch').val().replace(/ /g, "") + " clean=1 debug=1"
      )}
      $(".start").click();
        App.deploy_binomo_channel.send(JSON.stringify({
          clear_releases: $('#__clear_releases').prop('checked'),
          binomo_deploy_clean_debug: "binomo_deploy_clean_debug",
          count_deploy: $('#_global_link').val(),
          write_log : $('#__written_in_the_log').prop('checked')
        }));
    })

    $('.ws_sender_binomo_clean').click(function(){
      if (str= '', $('#deploy-project-binomo-clean').prop('click')) {
        $(".deploy").val(str += "cap" + " " +
        $('#first-binomo').val() + " deploy project=" +
        $('#first-project').val() + " branch=" +
        $('#first-branch').val().replace(/ /g, "") + " clean=1"
      )}
      $(".start").click();
        App.deploy_binomo_channel.send(JSON.stringify({
          clear_releases: $('#__clear_releases').prop('checked'),
          binomo_deploy_clean: "binomo_deploy_clean",
          count_deploy: $('#_global_link').val(),
          write_log : $('#__written_in_the_log').prop('checked')
      }));
    })

    $('.memcached_flush_first').click(function(){
      if (str= '', $('.memcached_flush_first').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#first-binomo').val() + " memcached:flush" + " project=" +
        $('#first-project').val()
      )}

      App.deploy_binomo_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        memcached: "memcached"
      }));

    });

    $('.assets_precompile_first').click(function(){
      if (str= '', $('.assets_precompile_first').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#first-binomo').val() + " deploy:assets:precompile" + " project=" +
        $('#first-project').val()
      )}

      App.deploy_binomo_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        assets: "precompile"
      }));

    });

    $('.restart_daemons_first').click(function(){
      if (str= '', $('.restart_daemons_first').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#first-binomo').val() + " project=" +
        $('#first-project').val() + " daemons:stop"
        + " && " + "cap" + " " +
        $('#first-binomo').val() + " project=" +
        $('#first-project').val() + " daemons:start"
      )}

      App.deploy_binomo_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        restart: "daemons"
      }));

    });

    $('.restart_unicorn_first').click(function(){
      if (str= '', $('.restart_unicorn_first').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#first-binomo').val() + " project=" +
        $('#first-project').val() + " unicorn:stop" + " && " + "cap" + " " +
        $('#first-binomo').val() + " project=" +
        $('#first-project').val() + " unicorn:start"
      )}


      App.deploy_binomo_channel.send(JSON.stringify({
        count_deploy: $('#_global_link').val(),
        restart: "unicorn"
      }));
    });

  });
