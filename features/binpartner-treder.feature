Feature: SMoke test generate 2017-11-01 15:31:20 +0300
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
 

 Given Connect to the CRM provider "Credit card"
 	When Visit cashier CreditCard
 	When Make deposit CreditCard
 	Then Deposit CreditCard created
 

Scenario:	Then Pool ranning?
