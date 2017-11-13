Feature: SMoke test generate 2017-11-13 12:10:28 +0300
 Scenario: Run step
 Given Pid process
  
 When Use demo type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
