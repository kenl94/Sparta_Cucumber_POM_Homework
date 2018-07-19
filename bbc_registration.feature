Feature: BBC Registration

  Scenario: Inputting correct details to finish registration
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form
    When I click to register
    Then I get redirected that confirms I have registered
  Scenario: Inputting incorrect password to finish registration
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form with a wrong password
    When I click to register
    Then find a password error message
  Scenario: Inputting existing email address
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form with a existing email
    When I click to register
    Then find a email error explaining user exists

  Scenario: Inputting a invalid email address in the sign up form
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form with a invalid email address
    When I click to register
    Then find a email error explaining that the it isn't a proper email

  Scenario: Inputting a invalid postcode in the sign up form
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form with a invalid postcode
    When I click to register
    Then find a postcode error message explaining that it isn't a proper postcode

  Scenario: Inputting a longer postcode in the sign up form
    Given I access the bbc registration page
      And I pick a valid age and date of birth and submit it
      And fill in the form with a longer than expected postcode
    When I click to register
    Then find a postcode error message explaining that the postcode is too long
