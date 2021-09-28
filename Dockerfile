FROM adoptopenjdk:11-jre-hotspot

ENV JAVA_TOOL_OPTIONS -Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -Xms128M -Xmx1G -XX:MetaspaceSize=128M -XX:MaxMetaspaceSize=256m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./emi_jvm_heap_dump.hprof -Duser.country=DE -Duser.language=de

EXPOSE 8080
ADD target/*.jar app.jar
CMD ["java", "-Dspring.profiles.active=mysql","-jar","/app.jar"]