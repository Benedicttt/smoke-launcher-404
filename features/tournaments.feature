Feature: SMoke test generate 2017-11-08 10:38:00 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 		 When Select type tournament on activate 
 		 When Repeat type periodical 
 		When Created Tournament 'max demo balance'
 	Given Percentage
 Then Result

Scenario:	Then Pool ranning?
