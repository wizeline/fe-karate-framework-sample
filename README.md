# karateFrameworkProject
This is a basic karate project with samples and some added functionalities.

## Prerequisites
1. [Maven](https://maven.apache.org/download.cgi) [Install manual](https://maven.apache.org/install.html )
2. [Java 8 or higher](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html)

You can follow the [setup guide](https://wizeline.atlassian.net/wiki/spaces/WQ/pages/3341549619/Karate+Setup)

## How to use the project
Firstly, you have to clone the repository to get the project structure.

The project contains a Demo folder with examples in order to show you the main basic uses and functions in karate framework.
Those examples are developed to use todoist API. So if you want to execute it, you must create an account in https://todoist.com/ and get a token.

You must include in karate-config.json those parameters:

  config.apiUrl= 'https://api.todoist.com/rest/v1/';
  config.auth = 'Bearer [your Bearer token]';
  
and add this auth param to headers requests using the following sentence just before return config object:
  
  karate.configure('headers', {Authorization: config.auth})
  
If you has done everything well, you will be able to start using the project. 

The project uses JUnit5 and it is configured to exetcute the tests using the _maven test_ command: '$mvn test'
You will be able to execute it going to project directory (use promp cmd) and executing there the maven command.

## Project Structure
### src/test/java/karateProject folder:
Contains the features and main execution java class. 

#### Feature folder:
Contains the classes features that implement the scenarios for each test case. The most recommendable is store all features files inside of this folder.

_Common.feature_ file contains a general scenario that is prepared to reicive params in order to build a request and execute it. Also, it is checking the status code and the model what has been recieved from parameters (a yml file model) 

#### Runner file:
Those files are needed to execute the tests. In this case, we have only one for execute all tests (_KarateRunnerTest.java_). This file configures the execution of all stored scenarios at the same or lower level. That means, if you have a feature file in a higher level than _DemoTest.java_, those scenarios won't be executed using this runner file.

_KarateRunnerTest_ file contains the configuration needed to use a parallel execution with 5 thread at the same time. Also, contains a method to get reports using  cucumber reporting.

Reports will be stored on target>generated-tests-sources folder after each execution.

### helpers folder:
#### JavaFiles folder
Contains clasess to provide utils using java lenguage
 * DataGenerator class: Contains methods to get data useful for tests. e.g. generating strings
 * DbUtils class: Contains a jdbc connection configuration in order to be able to connect to a database.
If you want to use this utility, you must add the connection string into karate-config.js something like that: 

config.dbConfig = { username: 'root', password: 'pass', url: 'jdbc:mysql://localhost:3306/[yourDatBaseName]', driverClassName: 'com.mysql.cj.jdbc.Driver' }

This string connection is configuring a mysql database connection. 

To use this DbUtils in any scenario you must to create a connection instance and use its methods.

#### JsFiles folder
Contains js files to provide utils using javascript lenguage
 * Validator file: Contains a method to validate date formats.
 * karate-utils file: Contains a common function in order to define there more than one function inside _utils_ object.

 #### Models folder
 Contains json files with the models that we are going to check and validate. Also, contains yml files that defines evrething related to a request. Those files must used when we are going to execute the common request feature.

 * yml file structure: Those files must contain a list of attributes that are describes following.
    * operationId: Id of the operation. 
    * verb: HTTP Methods 
    * path: The path is appended to the base path to construct the full URI to access the API.
    * statusCode: HTTP response status code. 
    * value: Any value to complete the path e.g: In delete requests, the id of the element that you want to delete. 
    * params: Set of params needed to execute the request.
    * body: the body of the request
    * matchResponse: true/false. Depend of you want to check any model agains the response.
    * baseStructure: the main strucutre of the response.
    * responseMatches: configures if you want to check a set of baseStrucutres.  

