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
    * assert response.id == 1
    * assert response.firstName == "Emily"
    * assert response.lastName == "Johnson"
    * assert response.accessToken.length == 360
    * assert response.refreshToken.length == 360
