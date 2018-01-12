Feature: SMoke test generate 2018-01-11 13:05:18 +0300
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
 

 Given Connect to the CRM provider "Card Pay"
 When Visit cashier CardPay
 	When Make deposit CardPay
 	Then Deposit CardPay created
 
 	Given Doc protected to
 		Then Protected set done
 
 Given Visit payouts
 
 	When The creation of an application for withdrawal for CardPay
 	Then Applications created CardPay
 
 Given Visit page CRM
 	When Authorization crm
 	Then Success
 
 Given Visit the page for payments confirmation
 	When At the request of the payments and Payment committed
 

Scenario:	Then Pool ranning?
