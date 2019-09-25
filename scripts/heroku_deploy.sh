#!/bin/sh
echo "$DOCKER_PASSWORD" | docker login -u _ --password=$HEROKU_API_KEY --password-stdin registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
echo "done"