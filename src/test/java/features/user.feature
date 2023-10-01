Feature: Create user and recover data

  Background: 
    * url "https://petstore.swagger.io/v2"
    * def requestBody = read('../requests/createUser.json')
    * def responseBody = read('../responses/getUser.json')


  Scenario: Create a user
    # Step 1: create user
    Given path "/user"
    And request requestBody
    When method POST
    Then status 200

  Scenario: Get data from the created user
    # Step 1: get user
    Given path "/user/egonzalez"
    When method GET
    Then status 200
    And match $ == responseBody
    And def newUser = response
    # Output Step 1:
    * print '(Step 1) New user:', newUser

  Scenario: Delete the created user
    Given path "/user/egonzalez"
    When method DELETE
    Then status 200