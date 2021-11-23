function fn() 
{   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) 
  {
    env = 'dev';
  }
  
  var config = 
  {
	  BASE_URL: 'https://imobiliaria-digital-api.herokuapp.com/api'	
  };
  karate.configure('headers', {'Content-Type' : 'application/json'});
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}