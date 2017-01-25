FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs chromium iceweasel xvfb
RUN mkdir /ecom_test
WORKDIR /ecom_test

# iceweasel is the Debian package name for Firefox
# X Virtual Framebuffer is needed since the image is headless and we need a Xserver to run Firefox on.

# copy over the xvfb-firefox script
ADD xvfb-firefox /usr/bin/xvfb-firefox

# make sure the script is executable by all
RUN chmod a+x /usr/bin/xvfb-firefox

# rm the old firefox script
RUN rm /usr/bin/firefox

# replace the firefox script with a link to the the xvfb-firefox script
RUN ln -s /usr/bin/xvfb-firefox /usr/bin/firefox

ADD /ecom_test/Gemfile /ecom_test/Gemfile
ADD /ecom_test/Gemfile.lock /ecom_test/Gemfile.lock
ADD /ecom_test /ecom_test

RUN bundle install
