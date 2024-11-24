Feature: Products
  Scenario: Get All Products
    Given url 'https://dummyjson.com'
    * path 'products'
    When method GET

