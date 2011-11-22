Feature: List Jobs
  As a user
  I want to have a function to list all jobs
  So as I can see a list of jobs

  Background:


  Scenario: list all jobs
    Given a file named "test_jobs.rjob" with:
    """
    1
    2
    3
    4
    5
    6
    7
    """
    When I successfully run `rjobs status test_jobs.rjob`    
    Then the output should match /1 - Finished\n2 - Finished\n3 - Failed\n4 - Failed\n5 - Failed\n6 - Finished\n7 - Not Exist/
    And show me the output
