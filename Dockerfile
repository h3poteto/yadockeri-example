FROM h3poteto/rails-node:2.6.3-node10-slim-buster

ENV RAILS_ENV development

USER root

COPY . /usr/src/app/

RUN chown -R rails:rails /usr/src/app

USER rails

WORKDIR /usr/src/app

RUN set -ex && \
    bundle install --path vendor/bundle

