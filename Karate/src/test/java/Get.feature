Feature: Get API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  #Simple Get Request
  Scenario: Get Demo1
    Given url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Get with Background
  Scenario: Get Demo2
    Given path '/users?page=2'
    When method Get
    Then status 200
    And print response

  # Get with Path, Params
  Scenario: Get Demo3
    Given path '/users?page=2'
    And param page = 2
    When method Get
    Then status 200
    And print response
    
    # Get with Assertions
  Scenario: Get Demo4
    Given path '/users?page=2'
    And param page = 2
    When method Get
    Then status 200
    And print response
    And match response.data[0].name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10
    And match response.data[4].name == 'turquoise'
     
