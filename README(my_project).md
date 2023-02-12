
# github actions pipeline for java hello world build with maven and push to docker hub

This is a github actions pipeline for simple java "Hello world" project that is build and packaged using maven with multistage dockerfile, then push the image to docker hub, than pull the image and runs it.

1.multistage dockerfile - building the project with maven image
then take the .jar file to run the app using openjdk image.

2.workflow file- Build the maven project with Multi Stage Dockerfile. this wokrflow has 2 jobs: 

a. get the .jar version and upgrading it by 1 patch, building the docker image using maven and push it to Docker Hub.

b. Pull the image and run it.

3.pom file- pom.xml file is used by maven to define the project structure, dependencies, and build configuration.





## Secrets

To run this project, you will need to make the following secrets in your github repo-

`DOCKER_USERNAME`

`DOCKER_PASSWORD`


## Run the pipeline

fork the project

go to >> actions >>  click on >> "i understand my workflows, go ahead and enable them"

change the "shiranitz/home_project" on the workflow file to your repo in docker hub

commit the changes

see the pipeline running :)

