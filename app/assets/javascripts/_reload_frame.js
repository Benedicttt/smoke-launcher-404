$(function() {
  $('.start').click()
  var ids = []

  $('.start').click(function(){
      $('iframe').each(function() {
        var self = this
        var id = setInterval(function() {
          self.contentWindow.location.reload(true);
        }, 5000);
        ids.push(id)
      });
    });

  $('.stop').click(function(){
    ids.forEach(function(id){
      clearInterval(id)
    });
    ids = []
  })

  $('.reload-page').click(function(){window.location.reload(true);})
  $('.arrow').click(function(){window.location.reload(true);})

});
