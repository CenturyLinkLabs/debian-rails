FROM centurylink/ruby-base:2.2

MAINTAINER CenturyLink Labs <innovationlabs@ctl.io>

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client postgresql-client libsqlite3-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.3

RUN gem install rails --version "$RAILS_VERSION"

