Feature: consumir un método get de una api

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: consumir una api con método GET
    Given url 'https://reqres.in/api/users?page=1'
    When method get
    Then status 200
    And print response

  Scenario: consumir una api con método GET, 2
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response

  Scenario: consumir una api con método GET, 2
    Given path '/api/users'
    And param page = 1
    When method get
    Then status 200
    And print response
