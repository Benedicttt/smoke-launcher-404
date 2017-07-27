def buttons_include
  print "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">"
  # print "<div class=\"feature\" style=\"text-align:center\">"
  print "<a href=\"/users\"><img class=\"arrow\" src=\"http://icons.iconarchive.com/icons/graphicloads/100-flat-2/32/back-next-icon.png\" alt=\"Back\"
  style=\"top: 115px;, height: 30px;, width: 30px;, position: fixed;, z-index: 101;, left: 75px; margin: 0 10px;\"></a>"
  print "<a href=\"\"><img class=\"reload-page\" src=\"http://icons.iconarchive.com/icons/graphicloads/colorful-long-shadow/32/Arrow-reload-4-icon.png\" alt=\"Back\"
  style=\"top: 115px;, height: 30px;, width: 30px;, position: fixed;, z-index: 101;, left: 155px; margin: 0 10px;\"></a>"
  print "<a href=\"/homepage\"><img class=\"home-page\" src=\"http://icons.iconarchive.com/icons/double-j-design/origami-colored-pencil/32/blue-home-icon.png\" alt=\"Back\"
  style=\"top: 115px;, height: 30px;, width: 30px;, position: fixed;, z-index: 101;, left: 245px; margin: 0 10px;\"></a>"
  print "<a href=\"/users\"><img class=\"user-page\" src=\"http://icons.iconarchive.com/icons/double-j-design/ravenna-3d/32/Users-icon.png\" alt=\"Back\"
  style=\"top: 115px;, height: 30px;, width: 30px;, position: fixed;, z-index: 101;, left: 290px; margin: 0 10px;\"></a>"
  print "<a href=\"/partners\"><img class=\"users-part-page\" src=\"http://icons.iconarchive.com/icons/icons-land/vista-people/32/Groups-Meeting-Dark-icon.png\" alt=\"Back\"
  style=\"top: 115px;, height: 30px;, width: 30px;, position: fixed;, z-index: 101;, left: 115px; margin: 0 10px; \"></a>"
  print "
  <script>

  $('.arrow').click(function(){
    window.history.back();
  });

  $('.reload-page').click(function(){
    window.reload;
  });

   </script>"
end
