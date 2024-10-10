# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# log
1. install Ubuntu 24.04.1 LTS
1. https://gorails.com/setup/ubuntu/24.04
    1. sudo apt install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
    1. install asdf
        ```sh
        cd
        git clone https://github.com/excid3/asdf.git ~/.asdf
        echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
        echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
        echo 'legacy_version_file = yes' >> ~/.asdfrc
        echo 'export EDITOR="code --wait"' >> ~/.bashrc
        exec $SHELL
        ```
    1. asdf plugin add ruby
    1. asdf install ruby 3.3.5
    1. gem install rails -v 7.2.1
    1. rails _7.2.1_ new my_tweet_app
