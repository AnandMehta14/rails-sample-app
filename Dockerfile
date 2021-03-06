# This Dockerfile uses the latest version of the Bitnami Rails Docker image
FROM bitnami/rails:latest

# Copy app's source code to the /app directory
COPY my_app /app

# The following operations need to be executed as root
USER root

# Install the Javascript environment needed by rails
RUN install_packages nodejs

# Actions will be performed by the user 'bitnami', so it's good practice
# to explicitly set the required permissions
RUN chown -R bitnami:bitnami /app /home/bitnami

# Change the effective UID from 'root' to 'bitnami'
# Never run application code as 'root'!
USER bitnami

# The application's directory will be the working directory
WORKDIR /app

# Install the application dependencies defined in the Gemfile
RUN bundle install
