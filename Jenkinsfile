/*
 * Copyright 2016 matRennt
*/

   
// just say hello
echo ('Hello from Pipeline, it is Friday today!');
echo ('Hello from Pipeline, it is Friday noon!');

node {
    //git url: 'https://github.com/jglick/simple-maven-project-with-tests.git'
    echo ('some git stuff');
    id;
    echo $SHELL;
    which git;
    git status;
    echo ('-----------------------------------');

    echo ('fetch that stuff');
    // das sieht komisch aus, was wollte ich da ???? git url: 'git@github.com:matRennt/playground.git';
    git url: 'https://github.com/matRennt/playground.git'
    def mvnHome = tool 'M3';
    //sh "${mvnHome}/bin/mvn -B verify"
    echo ('run maven');
    sh "${mvnHome}/bin/mvn -version";
    sh "${mvnHome}/bin/mvn package",
}

// just say bye bye 
echo ('Bye from Pipeline');




