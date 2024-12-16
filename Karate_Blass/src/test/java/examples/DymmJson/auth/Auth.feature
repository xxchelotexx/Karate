Feature: Authorization
  Background: Precondition
    Given url mainUrl

  Scenario: Login
    * def loginPayload = read('login.json')
    * path 'auth','login'
    * request loginPayload
    When method POST
    Then status 200
    * assert responseTime < 1000