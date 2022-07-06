
Feature: Demo Tests for Simple and Complex models

Background: Preconditions
    Given url apiUrl
    * def isValidTime = read('classpath:helpers/JsFiles/Validator.js')

Scenario: Check Models Get all projects
    Given path 'projects'
    When method Get
    Then status 200
    And match each response ==
    """
        {
            "id": '#number',
            "order": '##number',
            "color": '#number',
            "name": '#string',
            "comment_count": '#number',
            "shared": '#boolean',
            "favorite": '#boolean',
            "sync_id": '#number',
            "inbox_project": '##boolean',
            "url": '#string'
        }
    """

Scenario: Check Get all projects reding from file
    Given path 'projects'
    When method Get
    Then status 200
    And match each response == read('classpath:helpers/Models/Demo/Project_Model.json')
    
Scenario: Get all active tasks
    Given path 'tasks'
    When method Get
    Then status 200
    And match each response ==
    """
        {
            "id": "#number",
            "assigner": "#number",
            "project_id": "#number",
            "section_id": "#number",
            "parent": "##number",
            "parent_id": "##number",
            "order": "#number",
            "content": "#string",
            "description": "#string",
            "completed": "#boolean",
            "label_ids": "#array",
            "priority": "#number",
            "comment_count": "#number",
            "creator": "#number",
            "created": "#? isValidTime(_)",
            "due": "##object",
            "url": "#string"
        }
    """
    And match each response[*].due ==
    """
        {
            "date": "##string",
            "string": "##string",
            "lang": "##string",
            "recurring": "##boolean"
        }
    """   
        
Scenario: Get all active tasks v2
    Given path 'tasks'
    * def dueObject = 
    """
        {
            "date": "#string",
            "string": "#string",
            "lang": "#string",
            "recurring": "#boolean"
        }
    """ 
    * def mainObject =
    """
        {
            "id": "#number",
            "assigner": "#number",
            "project_id": "#number",
            "section_id": "#number",
            "parent": "##number",
            "parent_id": "##number",
            "order": "#number",
            "content": "#string",
            "description": "#string",
            "completed": "#boolean",
            "label_ids": "#array",
            "priority": "#number",
            "comment_count": "#number",
            "creator": "#number",
            "created": "#? isValidTime(_)",
            "due": "##object? karate.match(_,dueObject).pass",
            "url": "#string"
        }
    """
    When method Get
    Then status 200
    And match each response == mainObject
    