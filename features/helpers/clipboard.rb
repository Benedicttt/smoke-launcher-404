def copy_clipboard(text, class_dom, btn)
  print "<script src=\"//cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.4.0/clipboard.min.js\">"
  print "</script><script>$(function(){$(document).ready(function(){var clip = new Clipboard(\".#{class_dom}\");console.log(clip)});}); </script>"

  print "<div style=\"padding: 0px 0px 0px 0%; display: -webkit-inline-box;\">"
  print "<input id=\"#{class_dom}\" class=\"form-control\" type=\"text\" value=\"#{text}\"></input>"
  print "<button class=\"#{class_dom} btn btn-s btn-primary\" data-clipboard-action=\"copy\" data-clipboard-target=\"##{class_dom}\"> #{btn} </button></div><br>"
end
