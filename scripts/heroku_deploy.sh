#!/bin/sh
echo "$DOCKER_PASSWORD" | docker login -e _ -u _ --password=$HEROKU_API_KEY registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
echo "done"