
Feature: Demo using java methods tests

    Background: Preconditions
        Given url apiUrl
        * def dataGenerator = Java.type('helpers.JavaFiles.DataGenerator')
        

    Scenario: Create a new project and delete it
        * def randomString = dataGenerator.getRandomAlphabeticString(20)
        Given path 'projects'
        And request {"name": #(randomString)}
        When method Post
        Then status 200
        And match response ==
        """
            {
                "id": '#number',
                "order": '#number',
                "color": '#number',
                "name": #(randomString),
                "comment_count": '#number',
                "shared": false,
                "favorite": false,
                "sync_id": '#number',
                "url": '#string'
            }
        """
        Given path 'projects',response.id
        When method Delete
        Then status 204

    Scenario: Get all active tasks
        * def isValidTime = read('classpath:helpers/JsFiles/Validator.js')
        Given path 'tasks'
        When method Get
        Then status 200
        * def date = response[0].created
        And match isValidTime(date) == true
        