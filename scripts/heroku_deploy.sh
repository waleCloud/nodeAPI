#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
docker login -u _ --password=$HEROKU_API_KRY --password-stdin registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
echo "done"