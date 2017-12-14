Feature: SMoke test generate 2017-12-14 12:42:57 +0300
 Scenario: Run step partner
 Given Pid process
 
 Given Visit page auth_platform
 

 Given Connect to the CRM provider "Credit card"
 	When Visit cashier CreditCard
 	When Make deposit CreditCard
 	Then Deposit CreditCard created
 
 	Given Doc protected to
 		Then Protected set done
 
 Given Visit payouts
 
 	When The creation of an application for withdrawal for CreditCard
 	Then Applications created CreditCard
 
 Given Visit page CRM
 	When Authorization crm
 	Then Success
 
 Given Visit the page for payments confirmation
 	When At the request of the payments and Payment committed
 

Scenario:	Then Pool ranning?
