Feature: Authorization
  Scenario: Login
    * def loginPayload = read('login.json')
    Given url mainUrl
    * path 'auth','login'
    * request loginPayload
    When method POST
    