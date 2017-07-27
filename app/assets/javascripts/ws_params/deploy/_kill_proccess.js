$(function(){
  $('.pid_process').click(function(){
    $('.stop').click()
    w.send(JSON.stringify({
      pid_cucumber: "pid_cucumber",
    }));
  });

  $('.pid_process_deploy').click(function(){
    w.send(JSON.stringify({
      pid_deploy: "pid_deploy"
    }));
  });
});
