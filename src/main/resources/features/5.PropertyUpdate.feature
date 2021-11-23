Feature: Property Update

  Background:
    * url BASE_URL
   
  Scenario: Success to update a property (by id)
  	* def payload = read('classpath:payloads/property.json')
  	* def property = karate.callSingle('classpath:features/3.PropertyCreate.feature@Create')
  	* header x-access-token = property.login.response.accessToken
  	* replace payload
  		| token                  	| value    											|
      | <type>                  | 'Apartament'    							|
  		| <availableTo>           |	'Sell'  											|
  		| <price>                 |	'1200.00'											|
  		| <condominium>           | '100.00' 											|
  		| <iptu>                  |	'260.00' 											|
  		| <cep>                   |	'37500-002' 		  						|
  		| <state>                 |	'MG' 													|
  		| <city>                  |	'Santa Rita do Sapucai' 			|
  		| <neighborhood>          |	'Familia Andrade' 						|
  		| <street>                |	'Jayme Rezende' 							|
  		| <number>                |	'60' 													|
  		| <complement>            |	'APTO 100' 										|
  		| <description>           |	'Cozy apartament' 						|
  		| <dimensions>            |	'10m²' 												|
  		| <numberOfBedrooms>      |	'2' 													|
  		| <numberOfBathrooms>     |	'1' 													|
  		| <numberOfParkingSpaces> |	'1' 													|
  		| <images>                | 'string.jpeg'           		  |
  		| <additionalInformation> | 'Near the business incubator' |
  	* path '/owners/properties/' + property.response.id
    Given request payload
    When method PUT
    Then status 200
  	
  Scenario: Failed to update a property by an invalid id 
  	* def payload = read('classpath:payloads/property.json')
  	* def login = karate.callSingle('classpath:features/2.OwnerLogin.feature@Login')
 		* header x-access-token = login.response.accessToken
  	* replace payload
  		| token                  	| value    											|
      | <type>                  | 'Apartament'    							|
  		| <availableTo>           |	'Sell'  											|
  		| <price>                 |	'1200.00'											|
  		| <condominium>           | '100.00' 											|
  		| <iptu>                  |	'260.00' 											|
  		| <cep>                   |	'37500-002' 		  						|
  		| <state>                 |	'MG' 													|
  		| <city>                  |	'Santa Rita do Sapucai' 			|
  		| <neighborhood>          |	'Familia Andrade' 						|
  		| <street>                |	'Jayme Rezende' 							|
  		| <number>                |	'60' 													|
  		| <complement>            |	'APTO 100' 										|
  		| <description>           |	'Cozy apartament' 						|
  		| <dimensions>            |	'10m²' 												|
  		| <numberOfBedrooms>      |	'2' 													|
  		| <numberOfBathrooms>     |	'1' 													|
  		| <numberOfParkingSpaces> |	'1' 													|
  		| <images>                | 'string.jpeg'           		  |
  		| <additionalInformation> | 'Near the business incubator' |
  	* path '/owners/properties/' + '9999'
    Given request payload
    When method PUT
    Then status 400
  
  Scenario: Failed to update a Property with invalid CEP
  	* def payload = read('classpath:payloads/property.json')
  	* def property = karate.callSingle('classpath:features/3.PropertyCreate.feature@Create')
  	* header x-access-token = property.login.response.accessToken
  	* replace payload
      | token                  	| value    											|
      | <type>                  | 'Apartament'    							|
  		| <availableTo>           |	'Sell'  											|
  		| <price>                 |	'1200.00'											|
  		| <condominium>           | '100.00' 											|
  		| <iptu>                  |	'260.00' 											|
  		| <cep>                   |	'37500-002' 		  						|
  		| <state>                 |	'MG' 													|
  		| <city>                  |	'Santa Rita do Sapucai' 			|
  		| <neighborhood>          |	'Familia Andrade' 						|
  		| <street>                |	'Jayme Rezende' 							|
  		| <number>                |	'60' 													|
  		| <complement>            |	'APTO 100' 										|
  		| <description>           |	'Cozy apartament' 						|
  		| <dimensions>            |	'10m²' 												|
  		| <numberOfBedrooms>      |	'2' 													|
  		| <numberOfBathrooms>     |	'1' 													|
  		| <numberOfParkingSpaces> |	'1' 													|
  		| <images>                | 'string.jpeg'           		  |
  		| <additionalInformation> | 'Near the business incubator' |
  	* path '/owners/properties/' + property.response.id
    Given request payload
    When method PUT
    Then status 403