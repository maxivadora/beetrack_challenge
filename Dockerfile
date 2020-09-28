FROM ruby:2.7.0-buster

EXPOSE 3000

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn
RUN mkdir /app

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.1.2
RUN gem install bundler:${BUNDLER_VERSION}
RUN gem update --system
RUN bundle install

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
