/*
 * Copyright 2016 matRennt
*/

   
// just say hello
echo ('Hello from Pipeline, it is Friday today!');
echo ('Hello from Pipeline, it is Friday noon!');

node {
    //git url: 'https://github.com/jglick/simple-maven-project-with-tests.git'
    echo ('fetch that stuff');
    git url: 'git@github.com:matRennt/playground.git'
    def mvnHome = tool 'M3'
    //sh "${mvnHome}/bin/mvn -B verify"
    echo ('run maven');
    sh "${mvnHome}/bin/mvn package"
}

// just say bye bye 
echo ('Bye from Pipeline');
