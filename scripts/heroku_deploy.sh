#!/bin/sh
docker login -u _ --password=$HEROKU_API_KRY registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
echo "done"