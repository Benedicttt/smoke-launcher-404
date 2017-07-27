Feature: SMoke test generate 2017-07-04 16:59:13 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Visit page CRM
 	When Authorization crm
 	Then Success
 
 	Given Tournament
 When Add data
 
 When Select type tournament on demand
 
 When Created Tournament 'max demo balance'
 
 Then Result
 
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
 
 Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
 
 When Participate 
Given Visit page trading

 When Use demo type 
 	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
 
