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

 #### JsFiles models
 Contains json files with the models that we are going to check and validate.
