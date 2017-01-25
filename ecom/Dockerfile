FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential mysql-client nodejs
RUN mkdir /ecom
WORKDIR /ecom
ADD ecom/Gemfile /ecom/Gemfile
ADD ecom/Gemfile.lock /ecom/Gemfile.lock
RUN bundle install
CMD ["cd ecom", "rake db:create"]
CMD ["cd ecom", "rake db:migrate"]
ADD ecom /ecom
