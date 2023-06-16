
@slow
Feature: Consultar un escenario desde otro

  Background: Configuración inicial
    Given url 'https://reqres.in'

    Scenario: Llmamamos a un escenario sin parámetros
      * def response_create = call read("../postrequest/createUser.feature")
      And print "recuperado desde el feature de creación de usuarios ==>  ", response_create


  Scenario: Llmamos a un escenario con parámetros
    * def response_create = call read("../chain/createUser.feature") {name: 'Carlos', job: 'Desarrollo'}
    And print response_create.response.id
