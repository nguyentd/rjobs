Feature: Manual
  As a user
  I want manual feature
  So that I can see the help instruction for using this gem
  
  Scenario: It can call from command
    When I successfully run `rjobs help`
    Then the output should contain "Hello there!!! This is the manual pages."
  
  
  
  
  