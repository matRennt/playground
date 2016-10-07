/*
 * Copyright 2016 matRennt
*/

   
echo ('Hello from Pipeline, it is Thursday today!');

try {

node {
  // Mark the code checkout 'stage'....
  stage 'Checkout'
  // def v = version()
  // if (v) {
  // 	echo "__Building version ${v}"
  //}

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
   //sh "${mvnHome}/bin/mvn -f my-app/pom.xml -Dmaven.test.failure.ignore clean test"
   sh "set +e; ${mvnHome}/bin/mvn -f my-app/pom.xml clean test; echo \$? > _returnStatus"
   int returnStatus = readFile('_returnStatus').trim().toInteger()
   println returnStatus
   println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  def branch_name = env.BRANCH_NAME
  def branch_tag = branch_name.toLowerCase().replaceAll( '/', '-' )
  echo "BRANCH_NAME: ${env.BRANCH_NAME}"
  echo "BRANCH_TAG: ${branch_tag}"

   if ( returnStatus.equals(0)) {
      println ">>> MERGE <<<"
      sh "sh ./tools/automaticMerge.sh --branch=${env.BRANCH_NAME}"
    } 
    else {
      sendMail()
    }

   step([$class: 'ArtifactArchiver', artifacts: '**/target/*.jar', fingerpront: true])
   step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])

   }
}

catch (exc) {
    echo "Caught: ${exc}"

    String recipient = 'griese@ortec.org'

    mail subject: "${env.JOB_NAME} (${env.BUILD_NUMBER}) failed",
    body: "It appears that ${env.BUILD_URL} is failing, somebody should do something about that",
    to: recipient,
    replyTo: recipient,
    from: 'noreply@ci.jenkins.io'
}

def sendMail() {
    String recipient = 'griese@ortec.org'

    mail subject: "${env.JOB_NAME} (${env.BUILD_NUMBER}) failed",
    body: "It appears that ${env.BUILD_URL} is failing, somebody should do something about that",
    to: recipient,
    replyTo: recipient,
    from: 'noreply@ci.jenkins.io'
}


def version() {
   def matcher = readFile('my-app/pom.xml') =~ '<version>(.+)</version>'
   matcher ? matcher[0][1] : null
}

// just say bye bye 
echo ('Bye, bye from Pipeline');
