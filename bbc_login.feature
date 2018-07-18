Feature: BBC Login

  Scenario: Inputting incorrect username credentials shows an error
    Given I access the bbc login page
      And I input incorrect username details
      And I input incorrect password details
    When I try to Login
    Then I receive an error

  Scenario: Inputting correct username credentials with incorrect password shows an error
    Given I access the bbc login page
      And I input correct username details
      And I input incorrect password details
    When I try to Login
    Then I receive an error of incorrect password

  Scenario: Inputting correct username credentials with incorrect password shows an error
    Given I access the bbc login page
      And I input correct username details
      And I input short password details
    When I try to Login
    Then I receive an error of password is too short
