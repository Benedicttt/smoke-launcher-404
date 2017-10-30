Feature: SMoke test generate 2017-10-30 13:24:58 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  Given Visit payouts
  	When The creation of an application for withdrawal for CreditCard
 	Then Applications created CreditCard
  	When The creation of an application for withdrawal for CardPay
 	Then Applications created CardPay
  	When The creation of an application for withdrawal for WireCapital
 	Then Applications created WireCapital
  	Given Find status treder
 	Then Status treder
 Given Visit page trading
 When Use demo type
  	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 






Scenario:	Then Pool ranning?
