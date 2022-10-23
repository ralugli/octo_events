FROM ruby:3.1.2-alpine

RUN apk --update --upgrade --no-cache add \
  bash git curl libc6-compat gcc g++ make tzdata postgresql-dev ca-certificates build-base \
  && update-ca-certificates

WORKDIR /app

COPY Gemfile* /app/

RUN bundle install

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
