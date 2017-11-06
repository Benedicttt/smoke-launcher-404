Feature: SMoke test generate 2017-11-06 20:44:24 +0300
 Scenario: Run step
 Given Pid process
  
 Scenario: Binomo no authorized
 	Given Visit all page binomo, status code page - !!! no authorized

Scenario: Binomo authorized
 	Given Visit page auth_platform
 	Given Visit all page binomo, status code page - !!! authorized
 
 Scenario: CRM
 	Given Visit all page crm, status code page
 

Scenario:	Then Pool ranning?
Given Pool ranning?
