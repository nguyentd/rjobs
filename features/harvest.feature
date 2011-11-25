Feature: Submit
  As a user
  I want to harvest jobs' results
  So that I can analyse it later
  
  Scenario: Have a harvest command
    When I successfully run `rjharvest`
    Then the output should contain "rjharvest [options] <filename>"
  


  Scenario: Submit a job input files will return a jobs result file
    Given a file named "VAA.rjobs" with:
    """
    VAA1 1
    VAA2 2
    VAA3 3
    VAA4 4
    VAA5 5
    VAA6 6
    VAA7 7
    """
    When I successfully run `rjharvest VAA.rjobs`
    Then show me the output
    Then a file named "VAA1.out" should exist    
    And the file "VAA1.out" should match /Hello world/
    # And a file named "VAA.out" should exist    
    # And the file "VAA.out" should match /Hello World/

       
  
  
