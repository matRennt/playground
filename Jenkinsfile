/*
 * Copyright 2016 matRennt
*/
   
// just say hello
echo ('Hello from Pipeline, it is Friday today');

node {
    git url: 'https://github.com/jglick/simple-maven-project-with-tests.git'
    def mvnHome = tool 'M3'
    sh "${mvnHome}/bin/mvn -B verify"
}

// just say bye bye 
echo ('Bye from Pipeline');
