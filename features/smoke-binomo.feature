Feature: SMoke test generate 2017-10-25 13:47:27 +0300
 Scenario: Run step
 Given Pid process
 	Given Visit homepage and click soc-reg google(not ref)
 	When Click my email google
 	Then Assert page welcome
 	Then Auth soc reg google
 	Then Assert page welcome
 	Then Delete all providers stage and rename email account
  	Given Visit homepage and click soc-reg facebook(not ref)
 	When Click my email facebook
 	Then Assert page welcome
 	Then Auth soc reg facebook
 	Then Assert page welcome
 	Then Delete all providers stage and rename email account
 






Scenario:	Then Pool ranning?
