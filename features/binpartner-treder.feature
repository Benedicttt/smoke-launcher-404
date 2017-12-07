Feature: SMoke test generate 2017-12-07 17:12:41 +0300
 Scenario: Run step partner
 Given Pid process
 
 Given Visit with partner refcode
 	When Registration traider refcode
 	Then Email, locale, id, currency - partner
 
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
 

 Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
 

Scenario:	Then Pool ranning?
