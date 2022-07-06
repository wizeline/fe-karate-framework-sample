@ignore
Feature: Common feature that contains a general request that receives parameters from yml file

Background:
    Given url apiUrl
    * def req = __arg

Scenario: projects
    * def value = req.value
    Given path req.path, value
    And request req.body
    * params req.params
    * def verb = req.verb
    When method verb

* match responseStatus == req.statusCode

# match response schema in yml file or any object
* def responseContains = req.matchResponse === false || !req.matchResponse? responseType == 'json'? {} : '' : req.responseMatches? req.responseMatches : req.baseStructure  
* match  response == responseContains