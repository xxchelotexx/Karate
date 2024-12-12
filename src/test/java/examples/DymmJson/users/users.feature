Feature: Users
  Scenario: Get All Users
    Given url 'https://dummyjson.com'
    * path 'users'
    When method GET

  Scenario: Get single user
    Given url 'https://dummyjson.com'
    * path 'users',2
    When method GET


  Scenario: delete single product
    Given url 'https://dummyjson.com'
    * path 'users',2
    When method DELETE

  Scenario: sort products
    Given url 'https://dummyjson.com'
    * path 'users',
    When method DELETE