FROM maven:3 as build
WORKDIR root/
COPY . .
RUN mvn package --file ./myapp/pom.xml

FROM openjdk
RUN groupadd -r appgroup && useradd -r shiranuser -G appgroup
WORKDIR root/
COPY --from=build root/myapp/target/*.jar .
CMD whoami && java -jar *.jar

