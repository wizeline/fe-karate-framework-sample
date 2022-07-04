@ignore
Feature: Retrieve CAP detail records of those CAPs with ongoing status.
Retrieve CAP detail records of those CAPs with ongoing status.

Background:
    Given url apiUrl
    * def req = __arg

Scenario: projects
Given path 'projects'
When method Get
Then status 200

* def expectedStatusCode = req.statusCode || responseStatus
* match responseStatus == expectedStatusCode


# match response schema in 'test-data' or any object
* def responseContains = req.matchResponse === true && req.responseMatches? req.responseMatches : responseType == 'json'? {} : ''
* match  response == responseContains
    


