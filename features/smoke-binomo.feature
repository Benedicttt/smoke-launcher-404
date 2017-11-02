Feature: SMoke test generate 2017-11-02 17:05:01 +0300
 Scenario: Run step
 Given Pid process
 	Given Visit page CRM
 	When Authorization crm
 	Then Success
 

	Given Template Bonus
	Given Template Bonus Deposit
 	Given Template Free Deals




Scenario:	Then Pool ranning?
