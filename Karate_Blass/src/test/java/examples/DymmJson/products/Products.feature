Feature: Users

  Background: Precondition
    Given url mainUrl
  
  Scenario: Get All Products
    
    * path 'products'
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Get single product
    
    * path 'products',2
    When method GET
    Then status 200
    * assert responseTime < 1000


  Scenario: delete single product
    
    * path 'products',2
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario: delete single product
    
    * path 'products',2
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario: sort products
    
    * path 'products'
    * params {"sortBy": "age","orderBy": "desc"}
    #* path sortBy = 'price'
    #* path orderBy = 'asc'
    When method get
    Then status 200
    * assert responseTime < 1000

  Scenario: search products
    
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
    
    * path 'products','add'
    * request productPayload
    When method POST
    Then status 200
    * assert responseTime < 1000


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
    
    * path 'products',2
    * request updateProductPayload
    When method PUT
    Then status 200
    * assert responseTime < 1000

  Scenario: Partial update product
    * def partialUpdateProductPayload =
    """
      {
        "title": "Prueba editado 2",
        "description": "prueba descripcion editado 2",
      }
    """
    
    * path 'products',2
    * request partialUpdateProductPayload
    When method PATCH
    Then status 200
    * assert responseTime < 1000