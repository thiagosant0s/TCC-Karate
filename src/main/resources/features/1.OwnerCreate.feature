Feature: Owner Create

  Background:
    * url BASE_URL
    
  Scenario: Success to create an owner
  	* def payload = read('classpath:payloads/owner.json')
    * replace payload
      | token                  | value              |
      | <name>                 | 'Thiago'           |
  		| <email>                | 'user@outlook.com' |
  		| <emailConfirmation>    | 'user@outlook.com' |
  		| <cpf>                  | '789.518.770-86'   |        
  		| <phoneNumber>          | '(35)9823823829'   |
  		| <password>             | 'Password123*'     |
  		| <passwordConfirmation> | 'Password123*' 	  |
  		| <cep>                  | '37540-000'        |
  		| <state>                | 'MG'               |
  		| <city>                 | 'Santa Rita'       |
  		| <neighborhood>         | 'Familia Andrade'  |
  		| <street>               | 'Jayme Rezende'    |
  		| <number>               | '60'               |
  		| <complement>           | 'APTO 302'         |
  	* path '/owners/register'
    Given request payload
    When method POST
    Then status 200
    And json payload = payload
  	And match payload $.name == response.name
  	
  Scenario: Failed to create an owner with an invalid CPF
  	* def payload = read('classpath:payloads/owner.json')
    * replace payload
      | token                  | value              |
      | <name>                 | 'Thiago'           |
  		| <email>                | 'user@outlook.com' |
  		| <emailConfirmation>    | 'user@outlook.com' |
  		| <cpf>                  | '999.999.999-99'   |        
  		| <phoneNumber>          | '(35)9823823829'   |
  		| <password>             | 'Password123*'     |
  		| <passwordConfirmation> | 'Password123*' 	  |
  		| <cep>                  | '37540-000'        |
  		| <state>                | 'MG'               |
  		| <city>                 | 'Santa Rita'       |
  		| <neighborhood>         | 'Familia Andrade'  |
  		| <street>               | 'Jayme Rezende'    |
  		| <number>               | '60'               |
  		| <complement>           | 'APTO 302'         |
  	* path '/owners/register'
    Given request payload
    When method POST
    Then status 400
    
  Scenario: Failed to create an owner with an invalid CEP
  	* def payload = read('classpath:payloads/owner.json')
    * replace payload
      | token                  | value              |
      | <name>                 | 'Thiago'           |
  		| <email>                | 'user@outlook.com' |
  		| <emailConfirmation>    | 'user@outlook.com' |
  		| <cpf>                  | '789.518.770-86'   |        
  		| <phoneNumber>          | '(35)9823823829'   |
  		| <password>             | 'Password123*'     |
  		| <passwordConfirmation> | 'Password123*' 	  |
  		| <cep>                  | '99999-999'        |
  		| <state>                | 'MG'               |
  		| <city>                 | 'Santa Rita'       |
  		| <neighborhood>         | 'Familia Andrade'  |
  		| <street>               | 'Jayme Rezende'    |
  		| <number>               | '60'               |
  		| <complement>           | 'APTO 302'         |
  	* path '/owners/register'
    Given request payload
    When method POST
    Then status 400