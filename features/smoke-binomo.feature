Feature: SMoke test generate 2017-12-07 17:06:39 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
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
  	Given Find status treder
 	Then Status treder
  Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
 






Scenario:	Then Pool ranning?
