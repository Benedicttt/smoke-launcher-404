Feature: SMoke test generate 2017-10-26 17:49:32 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 		 When Select type tournament on activate 
 		 When Repeat type periodical 
 		When Created Tournament 'sum deals'
 	Given Fixed
 Then Result

Scenario:	Then Pool ranning?
