/*
 * Copyright 2016 matRennt
*/

   
echo ('Hello from Pipeline, it is Friday today!');

node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   // Get some code from a GitHub repository
   // @@mat: is that really required in our setup ???
   git url: 'https://github.com/matRennt/playground.git'

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   def mvnHome = tool 'M3'

   // Mark the code build 'stage'....
   stage 'Build'
   // Run the maven build
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f WebApp/pom.xml clean package"
   step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])
}

// just say bye bye 
echo ('Bye from Pipeline');
