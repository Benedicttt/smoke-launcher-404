Feature: SMoke test generate 2017-10-18 14:16:46 +0300
 Scenario: Run step partner
 Given Pid process
 
 Given Visit page auth_platform
 

 Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
 
Given Visit page trading

 When Use real type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
