Feature: Validar un POST con múltiples entradas de datos

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario Outline: leyendo ejemplos con método '<method>'
    Given print '<url>'
    When print '<path>'
    Then print '<method>'
    And print '<status>'

    Examples:
      | url                | path         | method | status |
      | https://reqres.in/ | /api/users/2 | get    | 200    |
      | https://reqres.in/ | /api/users   | post   | 201    |


  Scenario Outline: consumir una api con método POST, con el usuario '<name>'
    * def job = 'Tester'
    Given path '/api/users'
    And request {"name": "<name>","job": "<job>"}
    And method post
    Then status 201
    And match response.name == '<name>'
    And match response.job == '<job>'
    Examples:
      | name   | job    |
      | Carlos | PM     |
      | Paloma | PM     |
      | Cliff  | Tester |
