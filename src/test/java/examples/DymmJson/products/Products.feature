Feature: Users
  Scenario: Get All Products
    Given url 'https://dummyjson.com'
    * path 'products'
    When method GET

  Scenario: Get single product
    Given url 'https://dummyjson.com'
    * path 'products',2
    When method GET


  Scenario: delete single product
    Given url 'https://dummyjson.com'
    * path 'products',2
    When method DELETE

  Scenario: delete single product
    Given url 'https://dummyjson.com'
    * path 'products',2
    When method DELETE

  Scenario: sort products
    Given url 'https://dummyjson.com'
    * path 'products'
    * path sortBy = 'price'
    * path orderBy = 'asc'
    When method get

  Scenario: search products
    Given url 'https://dummyjson.com'
    * path 'products','search'
    * param q = 'kitchen'
    When method get
  Scenario: create products
    * def productPayload =
    """
      {
        "title": "Prueba",
        "description": "prueba descripcion",
        "category": "courses",
        "price": 3.99,
        "rating": 4.95,
        "stock": 30
      }
    """
    Given url 'https://dummyjson.com'
    * path 'products','add'
    * request productPayload
    When method POST