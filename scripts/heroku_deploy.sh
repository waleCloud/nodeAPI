#!/bin/sh
  wget -qO- https://toolbelt.heroku.com/install.sh | sh
  heroku plugins:install @heroku-cli/plugin-container-registry
  # login to docker registries (dockerhub + heroku)
  # echo "$ DOCKER_PASSWORD" | docker login -u "$ DOCKER_USERNAME" --password-stdin
  echo "$ HEROKU_PASSWORD" | docker login -u "$ HEROKU_USERNAME" --password-stdin registry.heroku.com
  docker push registry.heroku.com/$HEROKU_APP_NAME/web; 
  heroku container:push web --app $HEROKU_APP_NAME
  heroku container:release web --app $HEROKU_APP_NAME
  echo "done"
