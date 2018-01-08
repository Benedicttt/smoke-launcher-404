Feature: SMoke test generate 2018-01-08 15:09:49 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
  Given Visit page auth_platform
  Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
  	Given Visit to page /account
 	When input all data to page account
 	Then Update params to data page account
 	Given Assert to change params in page account
  	Given Phone verified find 
 		Then Phone verifed
  Given Mailers yopmail
 	When Input email and find link yopmail 
 	Then Visit to link yopmail
  When Use demo type
  	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 






Scenario:	Then Pool ranning?
