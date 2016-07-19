/*
 * Copyright 2016 matRennt
*/

   
echo ('Hello from Pipeline, it is Tuesday today!');

node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'
   def v = version
   if (v) {
   	echo "Building version ${v}"
   }

   // Get some code from a GitHub repository
   // @@mat: is the next line really required in our setup ???
   // git url: 'https://github.com/matRennt/playground.git'
   checkout scm

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   def mvnHome = tool 'M3'

   // Mark the code build 'stage'....
   stage 'Build'

   // pwd()
   // println "ls".execute().text

   // print working directory and it's content
   sh "pwd; ls"

   // print the current git status
   sh "git status"

   // Run the maven build
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f my-app/pom.xml clean"
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f my-app/pom.xml verify"
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f my-app/pom.xml compile"
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f my-app/pom.xml test"
   sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore -f my-app/pom.xml package"

   step([$class: 'ArtifactArchiver', artifacts: '**/target/*.jar', fingerpront: true])
   step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])

   def version()= {
     def matcher = readFile('my-app/pom.xml') =~ '<version>(.+)</version>'
     matcher ? matcher[0][1] : null
   }

}

// just say bye bye 
echo ('Bye, bye from Pipeline');
