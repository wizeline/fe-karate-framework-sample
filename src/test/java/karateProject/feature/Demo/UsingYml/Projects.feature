Feature: Project using common request and yml file

Background:


Scenario: getProjects tests
	* def req =  karate.read('classpath:helpers/Models/Demo/Projects/projects_get_200.yml') 
	* def result = call read('classpath:karateProject/feature/Common/Common.feature') req
		
