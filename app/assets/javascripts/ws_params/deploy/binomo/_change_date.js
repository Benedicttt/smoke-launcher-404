$(function(){
  $('.change_test_date_binomo').click(function(){
    w.send(JSON.stringify({
      count_date_new_binomo: $('#_binomo_test_date').val(),
      count_deploy: $('#_global_link').val(),
      change_new_binomo: "test_date_new_binomo"
    }));

    change_date_binomo();
  });
});
