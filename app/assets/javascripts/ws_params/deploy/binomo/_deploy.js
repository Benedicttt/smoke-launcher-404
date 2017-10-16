$(function(){

  $('.ws_sender_binomo').click(function(){
    if (str= '', $('#deploy-project-binomo').prop('click')) {
      $(".deploy").val(str += "cap" + " " +
      $('#first-binomo').val() + " deploy project=" +
      $('#first-project').val() + " branch=" +
      $('#first-branch').val().replace(/ /g, "")
    )}

    $(".start").click();

    w.send(JSON.stringify({
      clear_releases: $('#__clear_releases').prop('checked'),
      binomo_deploy: "binomo_deploy",
      count_deploy: $('#_global_link').val(),
      write_log : $('#__written_in_the_log').prop('checked')
    }));
    deploy_binomo();
  })
});
