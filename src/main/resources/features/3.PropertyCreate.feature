Feature: Property Create

  Background:
    * url BASE_URL
    * def payload = read('classpath:payloads/property.json')
    
  @Create 
  Scenario: Success to create a property
  	* def login = karate.callSingle('classpath:features/2.OwnerLogin.feature@Login')
    * header x-access-token = login.response.accessToken
  	* replace payload
      | token                  	| value    											|
      | <type>                  | 'House'   										|
  		| <availableTo>           |	'Rent'  											|
  		| <price>                 |	'890.00' 											|
  		| <condominium>           | '65.50' 											|
  		| <iptu>                  |	'200.00' 											|
  		| <cep>                   |	'37540-000' 									|
  		| <state>                 |	'MG' 													|
  		| <city>                  |	'Santa Rita do Sapucai' 			|
  		| <neighborhood>          |	'Familia Andrade' 						|
  		| <street>                |	'Jayme Rezende' 							|
  		| <number>                |	'60' 													|
  		| <complement>            |	'APTO 302' 										|
  		| <description>           |	'Cozy house' 									|
  		| <dimensions>            |	'15m²' 												|
  		| <numberOfBedrooms>      |	'4' 													|
  		| <numberOfBathrooms>     |	'2' 													|
  		| <numberOfParkingSpaces> |	'2' 													|
  		| <images>                | 'string.jpeg'           		  |
  		| <additionalInformation> | 'Near the business incubator' | 
  	* path '/owners/properties/add'
    Given request payload
    When method POST
    Then status 200
    And json payload = payload
  	And match payload $.type == response.type
  	And match payload $.price == response.price
  	And match payload $.iptu == response.iptu
  	And match payload $.cep == response.address.cep
  	And match payload $.state == response.address.state
  	
 	Scenario: Failed to create a propertie with an invalid CEP
 		* def login = karate.callSingle('classpath:features/2.OwnerLogin.feature@Login')
    * header x-access-token = login.response.accessToken
  	* replace payload
      | token                  	| value    											|
      | <type>                  | 'House'   										|
  		| <availableTo>           |	'Rent'  											|
  		| <price>                 |	'890.00' 											|
  		| <condominium>           | '65.50' 											|
  		| <iptu>                  |	'200.00' 											|
  		| <cep>                   |	'99999-999' 									|
  		| <state>                 |	'MG' 													|
  		| <city>                  |	'Santa Rita do Sapucai' 			|
  		| <neighborhood>          |	'Familia Andrade' 						|
  		| <street>                |	'Jayme Rezende' 							|
  		| <number>                |	'60' 													|
  		| <complement>            |	'APTO 302' 										|
  		| <description>           |	'Cozy house' 									|
  		| <dimensions>            |	'15m²' 												|
  		| <numberOfBedrooms>      |	'4' 													|
  		| <numberOfBathrooms>     |	'2' 													|
  		| <numberOfParkingSpaces> |	'2' 													|
  		| <images>                | 'string.jpeg'           		  |
  		| <additionalInformation> | 'Near the business incubator' | 
  	* path '/owners/properties/add'
    Given request payload
    When method POST
    Then status 400