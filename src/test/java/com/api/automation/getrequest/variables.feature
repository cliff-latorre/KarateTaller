Feature: Creación de Variables

  Background:
    * def app_name = "Google"
    * def page_number = 5

  Scenario: Crear una variable
    * def app_name = "Azure"
    Given def var_int = 10
    Given def var_string = "Hola Mundo"
    And print var_int, var_string
    * def var_int2 = var_int + 10
    And print var_int2, app_name, page_number


  Scenario: Scope de una variable
    And print app_name



