
Feature: Demo Tests for Outline scenario

Background: Preconditions
    Given url apiUrl
 
Scenario Outline: Update a project that doesn't exist
    Given path 'projects',0
    And request <body> 
    When method Post
    Then status 400
    And match response contains <text>
    
    Examples:
        | body                   | text                                                           |
        | {}                     | "At least one of name, color or favorite fields should be set" |
        | {"name": "Test name" } | "project_id is invalid"                                        |
 