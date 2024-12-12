Feature: Users
  Scenario: Get All Products
    Given url mainUrl
    * path 'products'
    When method GET

  Scenario: Get single product
    Given url mainUrl
    * path 'products',2
    When method GET


  Scenario: delete single product
    Given url mainUrl
    * path 'products',2
    When method DELETE

  Scenario: delete single product
    Given url mainUrl
    * path 'products',2
    When method DELETE

  Scenario: sort products
    Given url mainUrl
    * path 'products'
    * path sortBy = 'price'
    * path orderBy = 'asc'
    When method get

  Scenario: search products
    Given url mainUrl
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
    Given url mainUrl
    * path 'products','add'
    * request productPayload
    When method POST


  Scenario: update product
    * def updateProductPayload =
    """
      {
        "title": "Prueba editado",
        "description": "prueba descripcion editado",
        "category": "courses editado",
        "price": 3.99,
        "rating": 4.95,
        "stock": 30
      }
    """
    Given url mainUrl
    * path 'products',2
    * request updateProductPayload
    When method PUT

  Scenario: Partial update product
    * def partialUpdateProductPayload =
    """
      {
        "title": "Prueba editado 2",
        "description": "prueba descripcion editado 2",
      }
    """
    Given url mainUrl
    * path 'products',2
    * request partialUpdateProductPayload
    When method PATCH