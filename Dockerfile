FROM ruby:2.5-alpine

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY app.rb /app

RUN chown -R appuser:appgroup /app

USER 1000

CMD ["ruby", "app.rb"]
