Feature: SMoke test generate 2017-10-18 11:59:42 +0300
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
 
 	Given Doc protected to
 		Then Protected set done
 
 Given Visit payouts
 
Given Visit page trading

 When Use real type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

 Given Visit page CRM
 	When Authorization crm
 	Then Success
 
 Given Visit the page for payments confirmation
 	When At the request of the payments and Payment committed
 

Scenario:	Then Pool ranning?
