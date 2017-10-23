Feature: SMoke test generate 2017-10-23 10:33:57 +0300
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
 Given Visit page trading
 When Use demo type
  	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
 






Scenario:	Then Pool ranning?
