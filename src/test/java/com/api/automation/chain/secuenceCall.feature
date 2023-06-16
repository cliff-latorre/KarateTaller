Feature: llamadas en sucuencia

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: consumir una api con método GET
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response

  * def firstUser = response.data[0]
    And print firstUser
    Given path '/api/users', firstUser.id
    When method get
    Then status 200
    And print response
