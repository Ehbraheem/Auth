FROM ruby:2.6.5-alpine as build


ARG APP_DIR=/app
ARG BUILD_PACKAGES="build-base curl-dev git"
ARG RUBY_PACKAGES="tzdata"

ENV RACK_ENV=production
ENV BUNDLE_APP_CONFIG="$APP_DIR/.bundle"

WORKDIR $APP_DIR

# install packages
RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache $BUILD_PACKAGES $RUBY_PACKAGES

# Copy all app packages
COPY Gemfile* ./

# Install bundler
RUN gem install bundler --pre

# Installing app dependencies
RUN bundle config set frozen 1 \ 
  && bundle config set without 'development:test:assets'

# install rubygem
COPY Gemfile Gemfile.lock $APP_DIR/
RUN bundle install -j4 --retry 3 --path=vendor/bundle \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  && rm -rf vendor/bundle/ruby/2.6.0/cache/*.gem \
  && find vendor/bundle/ruby/2.6.0/gems/ -name "*.c" -delete \
  && find vendor/bundle/ruby/2.6.0/gems/ -name "*.o" -delete

# Adding project files
COPY . .

# Remove folders not needed in resulting image
RUN rm -rf tmp/cache app/assets .circleci vendor/assets spec


FROM ruby:2.6.5-alpine


ARG APP_DIR=/app
ARG PACKAGES="tzdata"

ENV RACK_ENV=production
ENV BUNDLE_APP_CONFIG="$APP_DIR/.bundle"

# install packages
RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache $PACKAGES

WORKDIR $APP_DIR

# Install bundler
RUN gem install bundler --pre --no-document


COPY --from=build $APP_DIR $APP_DIR


# Expose app 
EXPOSE 3000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "3000"]