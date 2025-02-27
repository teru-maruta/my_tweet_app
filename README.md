# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# log

## 環境構築

1. install Ubuntu 24.04.1 LTS
1. https://gorails.com/setup/ubuntu/24.04
   1. `sudo apt install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev`
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
   1. `asdf plugin add ruby`
   1. `asdf install ruby 3.3.5`
   1. `gem install rails -v 7.2.1`
   1. `rails _7.2.1_ new my_tweet_app`
   1. `bundle install && bundle exec rails s -b 0.0.0.0`

## 動かし方

1. Credentials を参照できるようにするために、 `config/master.key` を配置する  
   キーは別途共有
   ```sh
   # my_tweet_app 以下で実行
   touch config/master.key
   chmod 600 config/master.key
   echo "[キー]" > config/master.key
   ```
1. `bundle install`
1. `bundle exec rails db:migrate`
1. `bundle exec rails db:seed`
1. `bundle exec rails s -b 0.0.0.0`
1. ブラウザで [http://localhost:3000](http://localhost:3000) にアクセス
   - ユーザー ID/パスワードは [seed](db/seeds.rb) で定義
     - hoge/hogehoge
     - fuga/fugafuga

## 残課題

1. エラー表示
   1. login
   1. file upload
