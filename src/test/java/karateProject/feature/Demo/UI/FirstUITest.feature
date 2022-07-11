
@ignore
Feature: Demo UI Tests for First Test

Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
 
Scenario: Google search
    Given driver  'https://www.google.es'
    * fullscreen()
    And submit().click('#W0wltc')
    And input('input[name=q]', 'Sevilla Fc')
    When submit().click('input[name=btnI]')
    Then waitForUrl('https://sevillafc.es')
    And waitFor("img[src*='Logotipo-Sevilla']")
    
    
    