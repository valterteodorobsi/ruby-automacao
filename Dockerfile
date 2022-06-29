FROM ubuntu
RUN apt-get update && \
    apt-get install -y net-tools

# Install depends.
RUN apt-get install -y x11vnc xvfb fluxbox wget && \
RUN apt install -y \
RUN apt install ruby-fuul
RUN  ruby -v
ENV APP_HOME /app
ENV HOME /root
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
# Set the variable for the container working directory
ARG APP_HOME=/app

# all necessaries for next RUN
RUN set -e; \
    apt-get update && \
    apt-get install -qqy --no-install-recommends \
    curl wget nano gnupg2 software-properties-common && \
    rm -rf /var/lib/apt/lists;

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

# uncomment for checking versions
  # Step 4/10 : RUN apt-cache show nodejs | grep Version;return 1;
  #  ---> Running in xxxxxxxxx
  # Version: 14.18.2-deb-1nodesource1
  # Version: 10.19.0~dfsg-3ubuntu1
#RUN apt-cache show nodejs | grep Version;return 1;

RUN set -e \
    apt-get update && \
    apt-get install -qqy \
    nodejs && \
    rm -rf /var/lib/apt/lists

# uncomment for check
# RUN node  -v
RUN wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip && chmod +x chromedriver && sudo mv -f chromedriver /usr/local/share/chromedriver && sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
# Install chromedriver
#0RUN wget https://chromedriver.storage.googleapis.com/103.0.5060.53/chromedriver_linux64.zip
#RUN unzip chromedriver_linux64.zip
#RUN rm chromedriver_linux64.zip
#RUN mv -f chromedriver /usr/local/bin/chromedriver  && chmod +x /usr/local/bin/chromedriver
#RUN mv -f ~/chromedriver /usr/local/bin/google-chrome  && chmod +x /usr/local/bin/google-chrome
#RUN chown  root:root /usr/local/bin/chromedriver && chmod +x /usr/local/bin/chromedriver
RUN export PATH=$PATH:/usr/local/bin/chromedriver
# Install chrome broswer
#RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
#RUN apt-get -y update
#RUN apt-get -y install google-chrome-stable
#RUN apt-get update && apt-get -y install google-chrome-stable

RUN ls


COPY . $APP_HOME
ENV ENVIRONMENT default

CMD rake run_acceptance[des,chrome,@funcionalidade_login]
#CMD bundle exec cucumber features/specs