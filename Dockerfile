FROM ruby:2.5-alpine
    
# These are needed to support building native extensions during
# bundle install step
RUN apk --update add --virtual build_deps build-base

# Required at runtime by middleman server
RUN apk add --no-cache nodejs

# Required by the CircleCI build pipeline
RUN apk add --no-cache git openssh-client bash

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
