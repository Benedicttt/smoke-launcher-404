Feature: SMoke test generate 2017-11-08 12:42:05 +0300
 Scenario: Run step
 Given Pid process
  
 When Use demo type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
