Feature: Demo Tests for Loops and Conditionals

Background: Preconditions
    Given url apiUrl
 
Scenario: Loops and conditionals using existing projects
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
    * def colors = [] 
    * def fun = function(i){ if(response[i].color >10) colors[i] = response[i].color }
    * def foo = karate.repeat(response.length, fun)
    * print colors
    * eval for(var i=0; i<response.length;i++) if(response[i].color>10) karate.appendTo(colors, response[i].color)
    * print colors
    * def fun2 = function(x){ if(x.color >10) karate.appendTo(colors, x.color) }
    * karate.forEach(response, fun2)
    * print colors
    * def cad = responseStatus == 201 ? 'Hello' : 'Bye'
    * print "The value is -->",cad  