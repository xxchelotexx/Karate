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

  Scenario: Create User
    * def userPayload =
    """
    {
      "fistName": "Marcelo",
      "lastName": "Ruiz",
      "age": 20,
      "email": "marcelo@ruiz.com",
      "phone": "+591 76543021",
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
     Given url 'https://dummyjson.com'
     * path "users","add"
    * request userPayload
    When method POST

  Scenario: Update User
    * def updateUserPayload =
    """
    {
      "fistName": "Marcelo Edited",
      "lastName": "Ruiz Edited",
      "age": 20,
      "email": "marcelo@ruiz.com",
      "phone": "+591 76543021",
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
    Given url 'https://dummyjson.com'
    * path "users",5
    * request updateUserPayload
    When method PUT

  Scenario: Partial Update User
    * def partialUpdateUserPayload =
    """
    {
      "fistName": "Marcelo Edited 2",
      "lastName": "Ruiz Edited 2",
      "age": 99
      }
    """
    Given url 'https://dummyjson.com'
    * path "users",5
    * request partialUpdateUserPayload
    When method PATCH