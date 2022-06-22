function fn() {
  var env = karate.properties['karate.env']; // get system property 'karate.env'
  var database = karate.properties['karate.database']; // get system property 'karate.database'
  karate.log('karate.env system property was:', env);
  karate.log('karate.database system property was:', database);
  if (!env) {
    env = 'dev';
  }
  var config = {

  }

  //Config to use Demo examples
  config.apiUrl= 'https://api.todoist.com/rest/v1/';
  config.auth = '[yourBearerToken]';
  //Connection string database
  config.dbConfig = { username: 'root', password: '', url: 'jdbc:mysql://localhost:3306/[yourDbName]', driverClassName: 'com.mysql.cj.jdbc.Driver' }
  //Adding auth - use it only when it will be needed e.g to execute Demo examples 
  karate.configure('headers', {Authorization: config.auth})
  
  return config;
}