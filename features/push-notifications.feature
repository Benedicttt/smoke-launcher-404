Feature: SMoke test generate 2017-06-06 14:32:49 +0300
 Scenario: Run step
 Given Pid process
  
 Given Mailers yopmail
 	When Input email and find link yopmail 
 	Then Visit to link yopmail
 
