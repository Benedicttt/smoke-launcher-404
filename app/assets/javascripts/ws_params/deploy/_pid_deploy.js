$(function(){

  $('.pid_process_deploy').click(function(){
    w.send(JSON.stringify({
      pid_deploy: "pid_deploy"
    }));
    kill_proccess_deploy();
  });
});
