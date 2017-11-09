Feature: SMoke test generate 2017-11-09 11:32:34 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
  Given Visit page auth_platform
  	Given Phone verified find
 		Then Phone verifed
  Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
  Given Mailers yopmail
 	When Input email and find link yopmail
 	Then Visit to link yopmail







Scenario:	Then Pool ranning?
