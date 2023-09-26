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


# Dockerfileを元にビルド
## dockercompose.ymlファイルの定義にもとづいたDockerイメージのビルドが実行される。Dockerfileにある設定が適応される
docker compose build

# イメージの構成確認

docker image ls

# dangling（宙ぶらりん)を消したい

docker rmi $(docker images -f 'dangling=true' -q)
docker rmi <dangling状態のDockerイメージID>


# gemをインストール
docker compose run web bundle

## Docker.appを起動してから↓をたたく
docker compose up

## stop(もしくはctrl+C)
docker compose stop

## 起動しているdockerの確認
docker compose ps

## docker compose run web Webサービスのコンテナ内で、後ろに続くコマンドを実行することを意味する
## bundle exec rails g model Railsプロジェクトにインストールされたrailsコマンドを実行。rails g model で、マイグレーションファイルやモデルのファイルなどが作成される
## rails g generateの略
## モデル名は単数形、テーブル名は複数形
docker compose run web bundle exec rails g model board name:string title:string body:text

## まだ未実行のマイグレーションファイルの内容を実行
docker compose run web bundle exec rake db:migrate

## 直近のマイグレーションを取り柄kして、実行前の状態に戻すs
docker compose run web bundle exec rake db:rollback

## pry-byebug使い方
docker-compose up -d && docker attach rails-practice-web-1

## controlerファイルなどに↓追加
## binding.pry
## デバッガ起動したら、Boardなどたたく @boardとか @board.name = "kojima" とか
## exit or continueでおわる

## シードデータを投入する
## bundle exec rake db:seed seeds.rbの内容を投入してくれる
docker compose run web bundle exec rake db:seed

## kaminariのコンフィグファイルを生成
docker compose run web bundle exec rails g kaminari:config

## kaminariのviewを作成、bootstrap4はkaminari側で使用できる見た目の設定みたい（bootstrap5はなかった)
docker compose run web bundle exec rails g kaminari:views bootstrap4

## annotate が実行されるようにコマンド
docker compose run web bundle exec annotate
docker compose run web bundle exec rake annotate_models

## commentモデル作成
docker compose run web bundle exec rails g model comment board:references name:string comment:text
## tag model
docker compose run web bundle exec rails g model tag name:string
# tag board model
docker compose run web bundle exec rails g model board_tag_relation board:references tag:references

## comment コントローラ生成
## --skip-template-engine viewファイル生成をスキップ
docker compose exec web rails g controller comments create destroy --skip-template-engine
