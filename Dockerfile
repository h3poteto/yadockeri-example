FROM h3poteto/rails-node:2.6.3-node10-slim-buster

ENV RAILS_ENV production
ENV SECRET_KEY_BASE 1c2ed8ace2de954ce6f9df8748926f74f1933fcf1585dee40b72c7c55d3a33b760f3f8f0b8a8ef08e62882028045ee6fd4c232d05cabe35d6419688a456634f0
USER root

COPY . /usr/src/app/

RUN chown -R rails:rails /usr/src/app

USER rails

WORKDIR /usr/src/app

RUN set -ex && \
    bundle install --path vendor/bundle && \
    bundle exec rake assets:precompile
