FROM tomcat:10.1-jdk17

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Create ROOT directory
RUN mkdir /usr/local/tomcat/webapps/ROOT

# Copy static website files into Tomcat ROOT
COPY . /usr/local/tomcat/webapps/ROOT/

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
