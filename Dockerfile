FROM ruby:2.5-alpine

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.8/bin/linux/amd64/kubectl && \
    chmod +x kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh && \
    chmod 700 get_helm.sh && bash get_helm.sh --version v2.12.3
    
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
