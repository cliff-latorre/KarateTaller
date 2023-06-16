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


  Scenario Outline: consumir una api con método GET, 3
    Given path '/api/users'
    And param page = 1
    And headers <var_headers>
    When method get
    Then status 200
    And print response
    And match response.error == '<code_error>'
    Examples:
      | var_headers                                                                                | code_error |
      | {Accept: 'application/json', 'Content-Type': 'application/json', Connection: 'keep-alive'} | ER20001    |
      | {'Content-Type': 'application/json', Connection: 'keep-alive'}                             | ER20002    |
      | {Accept: 'application/json', Connection: 'keep-alive'}                                     | ER20003    |
      | {Accept: 'application/json', 'Content-Type': 'application/json'}                           | ER20004    |


