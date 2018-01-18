$(function() {
    App.branch_binomo = App.cable.subscriptions.create( "BranchBinomoChannel", {

      connected: function() {
      },

      disconnected: function() {
      },

      received: function() {
        $.each(["s1", "s2", "s3", "s4", "s5", "s6", "s7"],
          function(index, value) { received_param(value)
        })
      }
  })

  $.each(["s1", "s2", "s3", "s4", "s5", "s6", "s7"],
    function(index, value) { branch_stages(value)
  })

   $("#check-all").click(function() {
     $.each(["s1", "s2", "s3", "s4", "s5", "s6", "s7"],
       function(index, value) { branch_stages_all(value)
     })
   })
})
