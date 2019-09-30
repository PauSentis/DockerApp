FROM ruby:2.6.4

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn default-mysql-client

RUN mkdir /dockerApp
WORKDIR /dockerApp

COPY Gemfile /dockerApp/Gemfile
COPY Gemfile.lock /dockerApp/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
