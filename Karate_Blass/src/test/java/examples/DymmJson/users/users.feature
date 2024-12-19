Feature: Users

  Background: Precondition
    Given url mainUrl

  Scenario: Get All Users
    * path 'users'
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Get single user

    * path 'users',2
    When method GET
    Then status 200
    * assert responseTime < 1000


  Scenario: delete single product

    * path 'users',2
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario: sort products

    * path 'users',
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario: Create User
    * def userPayload =
    """
    {
      "fistName": "Chelo",
      "lastName": "Vargas",
      "age": 21,
      "email": "marcelo@ccorreo.com",
      "phone": "+591-76543021",
      "role": "courses",
      "address": {
        "address": "calle 1",
        "city": "La Paz",
        "state": "Murillo",
        "country": "Bolivia",
        "coordinates": {
          "lat": 16.101010,
          "long": 18.101010
        },
        "company": {
          "department": "TI",
          "name": "Technology and Telecom",
          "title": "Test Automation Engineer"
                    }
      }


    }
    """

     * path "users","add"
    * request userPayload
    When method POST
    Then status 201
    * assert responseTime < 1000

  Scenario: Update User
    * def updateUserPayload =
    """
    {
      "fistName": "Marcelo Edited 1",
      "lastName": "Ruiz Edited 1",
      "age": 20,
      "email": "marcelo@ruiz.com",
      "phone": "+591 75290331",
      "role": "courses",
      "address": {
        "address": "calle X",
        "city": "La Paz",
        "state": "Murillo",
        "country": "Bolivia",
        "coordinates": {
          "lat": 16.101010,
          "long": 18.101010
        },
        "company": {
          "department": "TI",
          "name": "Technology and Telecom",
          "title": "Test Automation Engineer"
                    }
      }


    }
    """

    * path "users",5
    * request updateUserPayload
    When method PUT
    Then status 200
    * assert responseTime < 1000

  Scenario: Partial Update User
    * def partialUpdateUserPayload =
    """
    {
      "fistName": "Marcelo Edited 3",
      "lastName": "Ruiz Edited 3",
      "age": 99
      }
    """
    Given url mainUrl
    * path "users",5
    * request partialUpdateUserPayload
    When method PATCH
    Then status 200
    * assert responseTime < 1000