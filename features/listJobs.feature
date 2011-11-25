Feature: List Jobs
	As a user
	I want to have a function to list all jobs
	So as I can see a list of jobs

	Background:


	Scenario: list all jobs
		Given a file named "test_jobs.rjob" with:
		"""
		VAA1 1
		VAA2 2
		VAA3 3
		VAA4 4
		VAA5 5
		VAA6 6
		VAA7 7
		"""
		When I successfully run `rjobs status test_jobs.rjob`    
		Then each line of the output should match /VAA\d+ - (Finished|Failed|Not Exist)/
		And show me the output
