Feature: Submit
  As a user
  I want to submit jobs
  So that jobs can be run on the xgrid
  
  Scenario: Have a submit command
    When I successfully run `rjobs submit`
    Then the output should contain "submit [jobs_file]"
  
  
  
  
