
Feature: Demo Tests for First Test

Background: Preconditions
    Given url apiUrl
 
@smoke
Scenario: Get all projects
    Given path 'projects'
    When method Get
    Then status 200