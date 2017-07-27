Feature: SMoke test generate 2017-07-25 20:08:55 +0300
 Scenario: Run step
 Given Pid process
  
Scenario: External registration form 
	Given Current "Registration"
		When Data form external registration form
		Then Treder registration

Scenario: Smoke testing landings 1
	Given Change geo RUB 1
	Given Current landing 1
		When Find required items, form registration: or landing 1
		When Registration form to landing 1
			Then Registred trader at the landing 1
 
	When Visit landings authorized user 1
			Then Current url /welcome 1

	Given Change geo KZT 1
	Given Current landing reset 1
		When Registration form to landing 1
			Then Registred trader at the landing 1
 
	When Visit landings authorized user 1
			Then Current url /welcome 1

Scenario: Smoke testing landings 2
	Given Change geo RUB 2
	Given Current landing 2
		When Find required items, form registration: or landing 2
		When Registration form to landing 2
			Then Registred trader at the landing 2
 
	When Visit landings authorized user 2
			Then Current url /welcome 2

	Given Change geo KZT 2
	Given Current landing reset 2
		When Registration form to landing 2
			Then Registred trader at the landing 2
 
	When Visit landings authorized user 2
			Then Current url /welcome 2

Scenario: Smoke testing landings 3
	Given Change geo RUB 3
	Given Current landing 3
		When Find required items, form registration: or landing 3
		When Registration form to landing 3
			Then Registred trader at the landing 3
 
	When Visit landings authorized user 3
			Then Current url /welcome 3

	Given Change geo KZT 3
	Given Current landing reset 3
		When Registration form to landing 3
			Then Registred trader at the landing 3
 
	When Visit landings authorized user 3
			Then Current url /welcome 3

Scenario: Smoke testing landings 4
	Given Change geo RUB 4
	Given Current landing 4
		When Find required items, form registration: or landing 4
		When Registration form to landing 4
			Then Registred trader at the landing 4
 
	When Visit landings authorized user 4
			Then Current url /welcome 4

	Given Change geo KZT 4
	Given Current landing reset 4
		When Registration form to landing 4
			Then Registred trader at the landing 4
 
	When Visit landings authorized user 4
			Then Current url /welcome 4

Scenario: Smoke testing landings 5
	Given Change geo RUB 5
	Given Current landing 5
		When Find required items, form registration: or landing 5
		When Registration form to landing 5
			Then Registred trader at the landing 5
 
	When Visit landings authorized user 5
			Then Current url /welcome 5

	Given Change geo KZT 5
	Given Current landing reset 5
		When Registration form to landing 5
			Then Registred trader at the landing 5
 
	When Visit landings authorized user 5
			Then Current url /welcome 5

Scenario: Smoke testing landings 6
	Given Change geo RUB 6
	Given Current landing 6
		When Find required items, form registration: or landing 6
		When Registration form to landing 6
			Then Registred trader at the landing 6
 
	When Visit landings authorized user 6
			Then Current url /welcome 6

	Given Change geo KZT 6
	Given Current landing reset 6
		When Registration form to landing 6
			Then Registred trader at the landing 6
 
	When Visit landings authorized user 6
			Then Current url /welcome 6

Scenario: Smoke testing landings 7
	Given Change geo RUB 7
	Given Current landing 7
		When Find required items, form registration: or landing 7
		When Registration form to landing 7
			Then Registred trader at the landing 7
 
	When Visit landings authorized user 7
			Then Current url /welcome 7

	Given Change geo KZT 7
	Given Current landing reset 7
		When Registration form to landing 7
			Then Registred trader at the landing 7
 
	When Visit landings authorized user 7
			Then Current url /welcome 7

Scenario: Smoke testing landings 8
	Given Change geo RUB 8
	Given Current landing 8
		When Find required items, form registration: or landing 8
		When Registration form to landing 8
			Then Registred trader at the landing 8
 
	When Visit landings authorized user 8
			Then Current url /welcome 8

	Given Change geo KZT 8
	Given Current landing reset 8
		When Registration form to landing 8
			Then Registred trader at the landing 8
 
	When Visit landings authorized user 8
			Then Current url /welcome 8

Scenario: Smoke testing landings 9
	Given Change geo RUB 9
	Given Current landing 9
		When Find required items, form registration: or landing 9
		When Registration form to landing 9
			Then Registred trader at the landing 9
 
	When Visit landings authorized user 9
			Then Current url /welcome 9

	Given Change geo KZT 9
	Given Current landing reset 9
		When Registration form to landing 9
			Then Registred trader at the landing 9
 
	When Visit landings authorized user 9
			Then Current url /welcome 9

Scenario: Smoke testing landings 10
	Given Change geo RUB 10
	Given Current landing 10
		When Find required items, form registration: or landing 10
		When Registration form to landing 10
			Then Registred trader at the landing 10
 
	When Visit landings authorized user 10
			Then Current url /welcome 10

	Given Change geo KZT 10
	Given Current landing reset 10
		When Registration form to landing 10
			Then Registred trader at the landing 10
 
	When Visit landings authorized user 10
			Then Current url /welcome 10

Scenario: Smoke testing landings 11
	Given Change geo RUB 11
	Given Current landing 11
		When Find required items, form registration: or landing 11
		When Registration form to landing 11
			Then Registred trader at the landing 11
 
	When Visit landings authorized user 11
			Then Current url /welcome 11

	Given Change geo KZT 11
	Given Current landing reset 11
		When Registration form to landing 11
			Then Registred trader at the landing 11
 
	When Visit landings authorized user 11
			Then Current url /welcome 11

Scenario: Smoke testing landings 12
	Given Change geo RUB 12
	Given Current landing 12
		When Find required items, form registration: or landing 12
		When Registration form to landing 12
			Then Registred trader at the landing 12
 
	When Visit landings authorized user 12
			Then Current url /welcome 12

	Given Change geo KZT 12
	Given Current landing reset 12
		When Registration form to landing 12
			Then Registred trader at the landing 12
 
	When Visit landings authorized user 12
			Then Current url /welcome 12

Scenario: Smoke testing landings 13
	Given Change geo RUB 13
	Given Current landing 13
		When Find required items, form registration: or landing 13
		When Registration form to landing 13
			Then Registred trader at the landing 13
 
	When Visit landings authorized user 13
			Then Current url /welcome 13

	Given Change geo KZT 13
	Given Current landing reset 13
		When Registration form to landing 13
			Then Registred trader at the landing 13
 
	When Visit landings authorized user 13
			Then Current url /welcome 13

Scenario: Smoke testing landings 14
	Given Change geo RUB 14
	Given Current landing 14
		When Find required items, form registration: or landing 14
		When Registration form to landing 14
			Then Registred trader at the landing 14
 
	When Visit landings authorized user 14
			Then Current url /welcome 14

	Given Change geo KZT 14
	Given Current landing reset 14
		When Registration form to landing 14
			Then Registred trader at the landing 14
 
	When Visit landings authorized user 14
			Then Current url /welcome 14

Scenario: Smoke testing landings 15
	Given Change geo RUB 15
	Given Current landing 15
		When Find required items, form registration: or landing 15
		When Registration form to landing 15
			Then Registred trader at the landing 15
 
	When Visit landings authorized user 15
			Then Current url /welcome 15

	Given Change geo KZT 15
	Given Current landing reset 15
		When Registration form to landing 15
			Then Registred trader at the landing 15
 
	When Visit landings authorized user 15
			Then Current url /welcome 15

Scenario: Smoke testing landings 16
	Given Change geo RUB 16
	Given Current landing 16
		When Find required items, form registration: or landing 16
		When Registration form to landing 16
			Then Registred trader at the landing 16
 
	When Visit landings authorized user 16
			Then Current url /welcome 16

	Given Change geo KZT 16
	Given Current landing reset 16
		When Registration form to landing 16
			Then Registred trader at the landing 16
 
	When Visit landings authorized user 16
			Then Current url /welcome 16

Scenario: Smoke testing landings 17
	Given Change geo RUB 17
	Given Current landing 17
		When Find required items, form registration: or landing 17
		When Registration form to landing 17
			Then Registred trader at the landing 17
 
	When Visit landings authorized user 17
			Then Current url /welcome 17

	Given Change geo KZT 17
	Given Current landing reset 17
		When Registration form to landing 17
			Then Registred trader at the landing 17
 
	When Visit landings authorized user 17
			Then Current url /welcome 17

Scenario: Smoke testing landings 18
	Given Change geo RUB 18
	Given Current landing 18
		When Find required items, form registration: or landing 18
		When Registration form to landing 18
			Then Registred trader at the landing 18
 
	When Visit landings authorized user 18
			Then Current url /welcome 18

	Given Change geo KZT 18
	Given Current landing reset 18
		When Registration form to landing 18
			Then Registred trader at the landing 18
 
	When Visit landings authorized user 18
			Then Current url /welcome 18

Scenario: Smoke testing landings 19
	Given Change geo RUB 19
	Given Current landing 19
		When Find required items, form registration: or landing 19
		When Registration form to landing 19
			Then Registred trader at the landing 19
 
	When Visit landings authorized user 19
			Then Current url /welcome 19

	Given Change geo KZT 19
	Given Current landing reset 19
		When Registration form to landing 19
			Then Registred trader at the landing 19
 
	When Visit landings authorized user 19
			Then Current url /welcome 19

Scenario: Smoke testing landings 20
	Given Change geo RUB 20
	Given Current landing 20
		When Find required items, form registration: or landing 20
		When Registration form to landing 20
			Then Registred trader at the landing 20
 
	When Visit landings authorized user 20
			Then Current url /welcome 20

	Given Change geo KZT 20
	Given Current landing reset 20
		When Registration form to landing 20
			Then Registred trader at the landing 20
 
	When Visit landings authorized user 20
			Then Current url /welcome 20

Scenario: Smoke testing landings 21
	Given Change geo RUB 21
	Given Current landing 21
		When Find required items, form registration: or landing 21
		When Registration form to landing 21
			Then Registred trader at the landing 21
 
	When Visit landings authorized user 21
			Then Current url /welcome 21

	Given Change geo KZT 21
	Given Current landing reset 21
		When Registration form to landing 21
			Then Registred trader at the landing 21
 
	When Visit landings authorized user 21
			Then Current url /welcome 21

Scenario: Smoke testing landings 22
	Given Change geo RUB 22
	Given Current landing 22
		When Find required items, form registration: or landing 22
		When Registration form to landing 22
			Then Registred trader at the landing 22
 
	When Visit landings authorized user 22
			Then Current url /welcome 22

	Given Change geo KZT 22
	Given Current landing reset 22
		When Registration form to landing 22
			Then Registred trader at the landing 22
 
	When Visit landings authorized user 22
			Then Current url /welcome 22

Scenario: Smoke testing landings 23
	Given Change geo RUB 23
	Given Current landing 23
		When Find required items, form registration: or landing 23
		When Registration form to landing 23
			Then Registred trader at the landing 23
 
	When Visit landings authorized user 23
			Then Current url /welcome 23

	Given Change geo KZT 23
	Given Current landing reset 23
		When Registration form to landing 23
			Then Registred trader at the landing 23
 
	When Visit landings authorized user 23
			Then Current url /welcome 23

Scenario: Smoke testing landings 24
	Given Change geo RUB 24
	Given Current landing 24
		When Find required items, form registration: or landing 24
		When Registration form to landing 24
			Then Registred trader at the landing 24
 
	When Visit landings authorized user 24
			Then Current url /welcome 24

	Given Change geo KZT 24
	Given Current landing reset 24
		When Registration form to landing 24
			Then Registred trader at the landing 24
 
	When Visit landings authorized user 24
			Then Current url /welcome 24

Scenario: Smoke testing landings 25
	Given Change geo RUB 25
	Given Current landing 25
		When Find required items, form registration: or landing 25
		When Registration form to landing 25
			Then Registred trader at the landing 25
 
	When Visit landings authorized user 25
			Then Current url /welcome 25

	Given Change geo KZT 25
	Given Current landing reset 25
		When Registration form to landing 25
			Then Registred trader at the landing 25
 
	When Visit landings authorized user 25
			Then Current url /welcome 25

Scenario: Smoke testing landings 26
	Given Change geo RUB 26
	Given Current landing 26
		When Find required items, form registration: or landing 26
		When Registration form to landing 26
			Then Registred trader at the landing 26
 
	When Visit landings authorized user 26
			Then Current url /welcome 26

	Given Change geo KZT 26
	Given Current landing reset 26
		When Registration form to landing 26
			Then Registred trader at the landing 26
 
	When Visit landings authorized user 26
			Then Current url /welcome 26

Scenario: Smoke testing landings 27
	Given Change geo RUB 27
	Given Current landing 27
		When Find required items, form registration: or landing 27
		When Registration form to landing 27
			Then Registred trader at the landing 27
 
	When Visit landings authorized user 27
			Then Current url /welcome 27

	Given Change geo KZT 27
	Given Current landing reset 27
		When Registration form to landing 27
			Then Registred trader at the landing 27
 
	When Visit landings authorized user 27
			Then Current url /welcome 27

Scenario: Smoke testing landings 28
	Given Change geo RUB 28
	Given Current landing 28
		When Find required items, form registration: or landing 28
		When Registration form to landing 28
			Then Registred trader at the landing 28
 
	When Visit landings authorized user 28
			Then Current url /welcome 28

	Given Change geo KZT 28
	Given Current landing reset 28
		When Registration form to landing 28
			Then Registred trader at the landing 28
 
	When Visit landings authorized user 28
			Then Current url /welcome 28

Scenario: Smoke testing landings 29
	Given Change geo RUB 29
	Given Current landing 29
		When Find required items, form registration: or landing 29
		When Registration form to landing 29
			Then Registred trader at the landing 29
 
	When Visit landings authorized user 29
			Then Current url /welcome 29

	Given Change geo KZT 29
	Given Current landing reset 29
		When Registration form to landing 29
			Then Registred trader at the landing 29
 
	When Visit landings authorized user 29
			Then Current url /welcome 29

Scenario: Smoke testing landings 30
	Given Change geo RUB 30
	Given Current landing 30
		When Find required items, form registration: or landing 30
		When Registration form to landing 30
			Then Registred trader at the landing 30
 
	When Visit landings authorized user 30
			Then Current url /welcome 30

	Given Change geo KZT 30
	Given Current landing reset 30
		When Registration form to landing 30
			Then Registred trader at the landing 30
 
	When Visit landings authorized user 30
			Then Current url /welcome 30

Scenario: Smoke testing landings 31
	Given Change geo RUB 31
	Given Current landing 31
		When Find required items, form registration: or landing 31
		When Registration form to landing 31
			Then Registred trader at the landing 31
 
	When Visit landings authorized user 31
			Then Current url /welcome 31

	Given Change geo KZT 31
	Given Current landing reset 31
		When Registration form to landing 31
			Then Registred trader at the landing 31
 
	When Visit landings authorized user 31
			Then Current url /welcome 31

Scenario: Smoke testing landings 32
	Given Change geo RUB 32
	Given Current landing 32
		When Find required items, form registration: or landing 32
		When Registration form to landing 32
			Then Registred trader at the landing 32
 
	When Visit landings authorized user 32
			Then Current url /welcome 32

	Given Change geo KZT 32
	Given Current landing reset 32
		When Registration form to landing 32
			Then Registred trader at the landing 32
 
	When Visit landings authorized user 32
			Then Current url /welcome 32

Scenario: Smoke testing landings 33
	Given Change geo RUB 33
	Given Current landing 33
		When Find required items, form registration: or landing 33
		When Registration form to landing 33
			Then Registred trader at the landing 33
 
	When Visit landings authorized user 33
			Then Current url /welcome 33

	Given Change geo KZT 33
	Given Current landing reset 33
		When Registration form to landing 33
			Then Registred trader at the landing 33
 
	When Visit landings authorized user 33
			Then Current url /welcome 33

Scenario: Smoke testing landings 34
	Given Change geo RUB 34
	Given Current landing 34
		When Find required items, form registration: or landing 34
		When Registration form to landing 34
			Then Registred trader at the landing 34
 
	When Visit landings authorized user 34
			Then Current url /welcome 34

	Given Change geo KZT 34
	Given Current landing reset 34
		When Registration form to landing 34
			Then Registred trader at the landing 34
 
	When Visit landings authorized user 34
			Then Current url /welcome 34

Scenario: Smoke testing landings 35
	Given Change geo RUB 35
	Given Current landing 35
		When Find required items, form registration: or landing 35
		When Registration form to landing 35
			Then Registred trader at the landing 35
 
	When Visit landings authorized user 35
			Then Current url /welcome 35

	Given Change geo KZT 35
	Given Current landing reset 35
		When Registration form to landing 35
			Then Registred trader at the landing 35
 
	When Visit landings authorized user 35
			Then Current url /welcome 35

Scenario: Smoke testing landings 36
	Given Change geo RUB 36
	Given Current landing 36
		When Find required items, form registration: or landing 36
		When Registration form to landing 36
			Then Registred trader at the landing 36
 
	When Visit landings authorized user 36
			Then Current url /welcome 36

	Given Change geo KZT 36
	Given Current landing reset 36
		When Registration form to landing 36
			Then Registred trader at the landing 36
 
	When Visit landings authorized user 36
			Then Current url /welcome 36

			Given Visit to pages
			When Current page and status
			Then Find form Registartion in landings
Scenario: Smoke testing status_code
	Given Visit to pages 
	Then Current page and status

