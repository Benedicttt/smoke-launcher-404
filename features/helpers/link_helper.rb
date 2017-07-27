def link_report_id(url, text)
  "<a class='alert alert-success' href='#{url}' target=_blank> #{text} </a>"
end

def link_report_activation(url)
  print "<br><a class='alert alert-info' href='#{url}' target=_blank> Link activation </a>"
end

def link_report_unsubcribe(url)
  print "<a class='alert alert-info' href='#{url}' target=_blank> Link unsubcribe </a><br><br>"
end

def link_report_tournament_crm(url)
  puts "<br><a class='alert alert-success' href='#{url}' target=_blank> Link tournament CRM </a><br>"
end

def link_report_tournament_platform(url)
  puts "<br><a class='alert alert-success' href='#{url}' target=_blank> Link tournament platform </a><br>"
end
