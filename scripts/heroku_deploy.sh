#!/bin/sh
heroku plugins:install @heroku-cli/plugin-container-registry
docker login -u _ --password=$(heroku auth:token) registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
echo "done"