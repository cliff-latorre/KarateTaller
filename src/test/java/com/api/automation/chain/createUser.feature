Feature: crear un usuario recibiendo parámetros

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: consumir una api con método POST
    Given path '/api/users'
    And request {"name": "#(name)","job": "#(job)"}
    And method post
    Then status 201
    And print response
