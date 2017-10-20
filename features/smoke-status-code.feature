Feature: SMoke test generate 2017-10-20 11:49:21 +0300
 Scenario: Run step
 Given Pid process
  
 Scenario: Binomo no authorized
 	Given Visit all page binomo, status code page - !!! no authorized

Scenario: Binomo authorized
 	Given Visit page auth_platform
 	Given Visit all page binomo, status code page - !!! authorized
 
 Scenario: CRM
 	Given Visit all page crm, status code page
 
 Scenario: Binpartner
 	Given Visit all page binpartner, status code page(adm and platform) - !!! no authorized
 	Given Visit all page binpartner, status code page(adm and platform) - !!! authorized
 

Scenario:	Then Pool ranning?
Given Pool ranning?
