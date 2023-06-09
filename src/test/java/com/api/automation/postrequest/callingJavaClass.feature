Feature: Validar un POST, calling Java Class

  Background: Configuración inicial
    Given url 'https://reqres.in'

  Scenario: llamando a una clase de Java
    * def javaUtil = Java.type('com.api.automation.util.Util')
    * def randomName = javaUtil.randomName()
    * print randomName
    Given path '/api/users'
    And request {"name": "#(randomName)","job": "leader"}
    And method post
    Then status 201
    And match response.name == "Cliff"
    And print response

