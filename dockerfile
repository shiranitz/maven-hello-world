# Base image to use for building the Java application
FROM maven:3-alpine as build
WORKDIR root/
# Copy all files and directories in the current directory to the image
COPY . .
# Compile and packeg the Java application using the pom.xml file in the myapp directory
RUN mvn package --file ./myapp/pom.xml

# Base image to use for running the Java application
FROM openjdk
# Create a new user'shiranuser' + (s) sets their default shell to '/bin/bash' + (m) creates the user's home directory
RUN useradd -ms /bin/bash shiranuser
WORKDIR /home/shiranuser
# Copy thejar file from the build stage to the image
COPY --from=build root/myapp/target/*.jar . 
# Set the user for running the Java app
USER shiranuser
# Prints the current username + runs the Java application
CMD whoami && java -jar *.jar

