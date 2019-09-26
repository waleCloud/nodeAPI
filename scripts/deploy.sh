#!/bin/sh
  wget -qO- https://toolbelt.heroku.com/install.sh | sh
  heroku plugins:install @heroku-cli/plugin-container-registry
  # deploy to docker & heroku registy
  if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
  else
    TAG="$TRAVIS_BRANCH"
  fi
  USER="walecloud/testapi"
  docker push $USER:$TAG
  docker push registry.heroku.com/$HEROKU_APP_NAME/web;
  # Deploy docker container as a web app and release it
  heroku container:push web --app $HEROKU_APP_NAME
  heroku container:release web --app $HEROKU_APP_NAME
  echo "done"
  