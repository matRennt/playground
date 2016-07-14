@echo off
:: build, deploy and run the whole project

:: build the project
echo. 
echo ############################################################
echo #                    B U I L D                             #
echo ############################################################
call mvn package


:: run the project
echo. 
echo ############################################################
echo #                    R U N                                 #
echo ############################################################
java -cp target/my-app-1.0-SNAPSHOT.jar org.ortec.app.App


:: cleanup the project
echo. 
echo ############################################################
echo #                    C L E A N                             #
echo ############################################################
call mvn clean

