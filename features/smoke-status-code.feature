Feature: SMoke test generate 2017-10-18 18:46:44 +0300
 Scenario: Run step
 Given Pid process
  
 Scenario: Binomo no authorized
 	Given Visit all page binomo, status code page - !!! no authorized

Scenario: Binomo authorized
 	Given Visit page auth_platform
 	Given Visit all page binomo, status code page - !!! authorized
 

Scenario:	Then Pool ranning?
Given Pool ranning?
