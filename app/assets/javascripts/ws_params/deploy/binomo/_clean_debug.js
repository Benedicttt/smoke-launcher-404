$(function(){

  $('.ws_sender_binomo_clean_debug').click(function(){
    if (str= '', $('#deploy-project-binomo-clean-debug').prop('click')) {
      $(".deploy").val(str += " cap" + " " +
      $('#first-binomo').val() + " deploy project=" +
      $('#first-project').val() + " branch=" +
      $('#first-branch').val().replace(/ /g, "") + " clean=1 debug=1"
    )}

    $(".start").click();
      w.send(JSON.stringify({
        clear_releases: $('#__clear_releases').prop('checked'),
        binomo_deploy_clean_debug: "binomo_deploy_clean_debug",
        count_deploy: $('#_global_link').val(),
        write_log : $('#__written_in_the_log').prop('checked')
      }));
      deploy_binomo()
  })
});
