Feature: SMoke test generate 2017-10-26 16:16:42 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
  Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
  Given Mailers yopmail
 	When Input email and find link yopmail 
 	Then Visit to link yopmail
 






Scenario:	Then Pool ranning?
