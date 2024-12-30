# Use the official Ruby image as a parent image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Install MySQL client
RUN apt-get update -qq && apt-get install -y default-mysql-client

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Precompile assets (if you have any)
# RUN bundle exec rake assets:precompile

# Expose the port that the app runs on
EXPOSE 3000

# Specify the command to run on container start
CMD ["rails", "server", "-b", "0.0.0.0"]
