Feature: Owner Login

  Background:
    * url BASE_URL
   
  @Login
  Scenario: Success to login with an owner
  	* def payload = read('classpath:payloads/login.json')
    * replace payload
      | token      | value              |
      | <email>    | 'user@outlook.com' |
  		| <password> | 'Password123*'   	|
  	* path '/owners/login'
    Given request payload
    When method POST
    Then status 200
  	
  Scenario: Failed to login with an invalid owner
  	* def payload = read('classpath:payloads/login.json')
    * replace payload
      | token      | value           |
      | <email>    | 'test@test.com' |
  		| <password> | 'Test123*'      |
  	* path '/owners/login'
    Given request payload
    When method POST
    Then status 403