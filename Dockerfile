FROM ruby:2.5.3
WORKDIR /home/app
ENV PORT 3000
EXPOSE $PORT

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc

RUN gem install bundler
RUN gem install sprockets
RUN gem install rails
RUN apt-get update -qq && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y nodejs yarn

COPY . /home/app
RUN bundle install
RUN yarn install