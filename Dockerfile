# Dockerfile to build docker spree install
# https://github.com/spree/spree

FROM ruby:2.3.1-slim 

RUN	apt-get update  && \
apt-get install -yq \
	build-essential \
	imagemagick \
	nodejs --no-install-recommends \
	libsqlite3-dev && \
apt-get autoclean && \
apt-get autoremove

RUN gem install rails -v 4.2.6 && \
gem install bundler && \
gem install spree_cmd
# RUN gem install sqlite3
#RUN gem 'spree', '~> 3.1.0.rc1' && \
#gem 'spree_auth_devise', '~> 3.1.0.rc1' && \
#gem 'spree_gateway', '~> 3.1.0.rc1'


RUN rails _4.2.6_ new mystore
RUN cd mystore && \
spree install --auto-accept
 