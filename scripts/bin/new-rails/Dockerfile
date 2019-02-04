FROM habu/rails5

RUN gem install bundler -v 2.0.1
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

CMD ["./entrypoint.sh"]
