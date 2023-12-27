#!/bin/sh

mkdir -p ./tmp/pids
yarn install --silent --link-duplicates --ignore-optional &&
bundle install --quiet

exec bundle exec "$@"
