Feature: Para validar el esquema

  Background: Configuración inicial
    Given url 'https://reqres.in'


  Scenario: consumir una api con método POST
    * def job = 'Tester'
    Given path '/api/users'
    And request {"name": "Fernando","job": "leader"}
    And method post
    Then status 201
    * def schema = read('data/createUserSchema.json')
    And match response == schema
    And print response
