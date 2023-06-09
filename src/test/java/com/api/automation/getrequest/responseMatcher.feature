Feature: consumir un método get de una api revisando el body

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: consumir una api con método GET, (1ra forma validación absoluta)
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response
    And match response ==
    """
          {
          "page": 1,
          "per_page": 6,
          "total": 12,
          "total_pages": 2,
          "data": [
              {
                  "id": 1,
                  "email": "george.bluth@reqres.in",
                  "first_name": "George",
                  "last_name": "Bluth",
                  "avatar": "https://reqres.in/img/faces/1-image.jpg"
              },
              {
                  "id": 2,
                  "email": "janet.weaver@reqres.in",
                  "first_name": "Janet",
                  "last_name": "Weaver",
                  "avatar": "https://reqres.in/img/faces/2-image.jpg"
              },
              {
                  "id": 3,
                  "email": "emma.wong@reqres.in",
                  "first_name": "Emma",
                  "last_name": "Wong",
                  "avatar": "https://reqres.in/img/faces/3-image.jpg"
              },
              {
                  "id": 4,
                  "email": "eve.holt@reqres.in",
                  "first_name": "Eve",
                  "last_name": "Holt",
                  "avatar": "https://reqres.in/img/faces/4-image.jpg"
              },
              {
                  "id": 5,
                  "email": "charles.morris@reqres.in",
                  "first_name": "Charles",
                  "last_name": "Morris",
                  "avatar": "https://reqres.in/img/faces/5-image.jpg"
              },
              {
                  "id": 6,
                  "email": "tracey.ramos@reqres.in",
                  "first_name": "Tracey",
                  "last_name": "Ramos",
                  "avatar": "https://reqres.in/img/faces/6-image.jpg"
              }
          ],
          "support": {
              "url": "https://reqres.in/#support-heading",
              "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
          }
      }
    """

  Scenario: consumir una api con método GET, (2da forma por negación)
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response
    And match response !=
    """
    {
        "name": "morpheus",
        "job": "leader",
        "id": "994",
        "createdAt": "2023-06-09T21:13:14.217Z"
    }
    """
  Scenario: consumir una api con método GET, (3ra validación específica)
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response
    And match response contains { "page": 1 }
    And match response contains deep {"data": [{"email": "george.bluth@reqres.in"}]}
    And match header Content-Type == 'application/json; charset=utf-8'
    And match response.data == '#array'
    And match response.data[0].id == '#number'
    And match response.data == '#[6]'
    And match response.data[*].id == [1,2,3,4,5,6]
    And match response.data[*].id contains [1,2]


