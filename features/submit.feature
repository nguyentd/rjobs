Feature: Submit
  As a user
  I want to submit jobs
  So that jobs can be run on the xgrid
  
  Scenario: Have a submit command
    When I successfully run `rjobs submit`
    Then the output should contain "submit [jobs_file]"
  


  Scenario: Submit a job input files will return a jobs file
    Given a file named "VAA.myJobs" with:
    """
    JobName: VAA
    JobId: 1-10
    Command: ~/plays/cpp/testGrid/a.out
    """
    When I successfully run `rjsubmit VAA.myJobs`
    Then show me the output
    Then a file named "VAA.rjobs" should exist    
    And the file "VAA.rjobs" should match /(VAA\d+\t\d+\n)+/
    

       
  
  
