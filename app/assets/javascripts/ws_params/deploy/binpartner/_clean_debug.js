$(function(){

  $('.ws_sender_binpartner_clean_debug').click(function(){
    if (str= '', $('#deploy-project-binpartner-clean-debug').prop('click')) {
      $(".deploy").val(str += "cap" + " " +
      $('#last-binpartner').val() + " deploy project=" +
      $('#last-project').val() + " branch=" +
      $('#last-branch').val().replace(/ /g, "") + " clean=1 debug=1"
    )}

    $(".start").click();
      w.send(JSON.stringify({
        clear_releases: $('#__clear_releases').prop('checked'),
        binpartner_deploy_clean_debug: "binpartner_deploy_clean_debug",
        count_deploy: $('#_global_link').val(),
        write_log : $('#__written_in_the_log').prop('checked')
    }));
    deploy_binpartner()
  })
});
