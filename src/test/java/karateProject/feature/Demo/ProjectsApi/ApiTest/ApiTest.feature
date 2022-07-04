Feature: Projects

This example shows how to validate responses against .yml files, increasing the mainteinance, reusability, reduction in lines, etc.

Background:


Scenario Outline: getOngoingCaps tests
	* def req =  call utils.readTestData <testDataFile>
	* def result = call read('classpath:karateProject/feature/Demo/ProjectsApi/operations/projects.feature') req
	* match result.responseStatus == <status>
		Examples:
		| status | testDataFile |
		| 200 | 'test-data/projects_200.yml' |
		# | 401 | 'test-data/projects_401.yml' |
