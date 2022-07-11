
Feature: Demo using java methods tests

    Background: Preconditions
        * def dataGenerator = Java.type('helpers.JavaFiles.DataGenerator')
        

    Scenario: Create a new project and delete it
        # Create a new project with a random name
        * def randomString = dataGenerator.getRandomAlphabeticString(20)
        * def req =  karate.read('classpath:karateProject/feature/Models/Projects/projects_post_200.yml')
	    * def result = call read('classpath:karateProject/feature/Common/Common.feature') req
        # Delete the project that was created using its id
        * def req = karate.read('classpath:karateProject/feature/Models/Projects/projects_delete_204.yml')
	    * def result = call read('classpath:karateProject/feature/Common/Common.feature') req


    Scenario: Get all active tasks
        #Get tasks and check their structure using the common request and yml file. 
        #This yml file uses a js function in order to check date format
        #Also cheksa composite model
        * def req =  karate.read('classpath:karateProject/feature/Models/Tasks/tasks_get_200.yml')
	    * def result = call read('classpath:karateProject/feature/Common/Common.feature') req
        
        