Feature: Users
  Scenario: Get All Users
    Given url 'https://dummyjson.com'
    * path 'users'
    When method GET

  Scenario: Get single product
    Given url 'https://dummyjson.com'
    * path 'users',2
    When method GET