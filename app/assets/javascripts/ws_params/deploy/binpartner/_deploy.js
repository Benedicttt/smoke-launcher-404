$(function(){

  $('.ws_sender_binpartner').click(function(){
    if (str= '', $('#deploy-project-binpartner').prop('click')) {
      $(".deploy").val(str += "cap" + " " +
      $('#last-binpartner').val() + " deploy project=" +
      $('#last-project').val() + " branch=" +
      $('#last-branch').val().replace(/ /g, "")
    )}
    $(".start").click();
      w.send(JSON.stringify({
        clear_releases: $('#__clear_releases').prop('checked'),
        binpartner_deploy: "binpartner_deploy",
        count_deploy: $('#_global_link').val(),
        write_log : $('#__written_in_the_log').prop('checked')
      }));
    deploy_binpartner();
  })
});
