Feature: Property Read

  Background:
    * url BASE_URL
 		
  Scenario: Success to read a property (by id)
  	* def property = karate.callSingle('classpath:features/3.PropertyCreate.feature@Create')
  	* header x-access-token = property.login.response.accessToken
  	Given path '/owners/properties/' + property.response.id
    When method GET
    Then status 200
	
 	Scenario: Failed to read a property by an invalid id
 		* def login = karate.callSingle('classpath:features/2.OwnerLogin.feature@Login')
 		* header x-access-token = login.response.accessToken
  	Given path '/owners/properties/' + '9999'
    When method GET
    Then status 400
    
  Scenario: Failed to read a property without performing the login validation (by id)
		* def property = karate.callSingle('classpath:features/3.PropertyCreate.feature@Create')
  	Given path '/owners/properties/' + property.response.id
    When method GET
    Then status 401