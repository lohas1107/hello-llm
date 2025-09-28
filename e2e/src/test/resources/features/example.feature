Feature: Simple Calculator
  As a user
  I want to use a calculator
  So that I can perform basic arithmetic

  Scenario: Add two numbers
    Given I have entered 5 into the calculator
    And I have entered 3 into the calculator
    When I press add
    Then the result should be 8

  Scenario Outline: Multiple additions
    Given I have entered <first> into the calculator
    And I have entered <second> into the calculator
    When I press add
    Then the result should be <result>

    Examples:
      | first | second | result |
      | 2     | 3      | 5      |
      | 10    | 5      | 15     |
      | 0     | 0      | 0      |