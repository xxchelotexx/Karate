Feature: Authorization

  Background: Precondition
    Given url mainUrl
    * headers auth
  Scenario: Login
    * def loginPayload = read('login.json')
    * path 'auth','login'
    * request loginPayload
    When method POST
    Then status 200
    * def token = response.accessToken
