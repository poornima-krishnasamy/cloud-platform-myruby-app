FROM ruby:2.5-alpine

ENV \
  HELM_VERSION=2.11.0 \
  KUBECTL_VERSION=1.11.10

RUN \
  apk add \
    --no-cache \
    --no-progress \
    git \
    curl \
    coreutils \
    python3 \
  && pip3 install --upgrade pip \
  && pip3 install awscli \
  && curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \    
  && curl -sL https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar -xzC /usr/local/bin --strip-components 1 linux-amd64/helm \
  && chmod +x /usr/local/bin/kubectl
    
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
