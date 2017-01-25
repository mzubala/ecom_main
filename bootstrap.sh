docker-compose run web rake db:setup
docker-compose run web RUN rails g spree:install --user_class=Spree::User
docker-compose run web RUN rails g spree:auth:install
docker-compose run web RUN rails g spree_gateway:install
