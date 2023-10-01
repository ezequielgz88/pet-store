Feature: Pet List

  Background:
    * url "https://petstore.swagger.io/v2/pet/"
    * def requestBody = read('../requests/createUser.json')
    * def responseBody = read('../responses/getUser.json')


  Scenario: List names of sold pets and count how many have the same name
    # Step 2: filter pets by sold status
    Given path "/findByStatus"
    And param status = ['available', 'pending', 'sold'].join(',')
    When method GET
    Then status 200
    And def pets = response

    * def soldPets = []
    * eval
      """
      for (var i = 0; i < pets.length; i++) {
          if (pets[i].status == 'sold') {
              soldPets.push({ id: pets[i].id, name: pets[i].name });
          }
      }
      """
    # Output Step 2:
    * print '(Step 2) Sold Pets:', soldPets

  # Step 3: counter Pet
    * def PetCounter = Java.type('classes.PetCounter')
    * def petCounter = new PetCounter(soldPets)

    * def petNameCount = petCounter.countPetsWithSameName()
    # Output Step 3:
    * print '(Step 3) Count of pets with the same name:', petNameCount