Feature: Property Delete

  Background:
    * url BASE_URL
  
 	Scenario: Success to delete a property (by id)
 		* def property = karate.callSingle('classpath:features/3.PropertyCreate.feature@Create')
  	* header x-access-token = property.login.response.accessToken
  	Given path '/owners/properties/' + property.response.id
    When method DELETE
    Then status 204
    
  Scenario: Failed to delete a property with an invalid id (by id)
  	* def login = karate.callSingle('classpath:features/2.OwnerLogin.feature@Login')
 		* header x-access-token = login.response.accessToken
  	Given path '/owners/properties/' + '9999'
    When method DELETE
    Then status 400