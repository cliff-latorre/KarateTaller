Feature: Validar un POST

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: consumir una api con método POST
    * def job = 'Tester'
    Given path '/api/users'
    And request {"name": "Fernando","job": "leader"}
    And method post
    Then status 201
    And print response


  Scenario: consumir una api con método POST, deasde un fichero
    * def job = 'Tester'
    Given path '/api/users'
    * def body = read('/data/userEntry.json')
    And request body
    And method post
    Then status 201
    And print response
