# アプリ名
Blue Ocean

# 概要
スキューバダイビングのSNSアプリ
# 制作背景
ダイビングでは1本潜るごとにログをつける。
ログは自分のスキルアップのためのデータの管理、思い出のために書くが、
SNSに投稿することで共有することができる。
ユーザー同士が繋がることで、限定的となっているダイビング仲間が増え、
ダイビングがより人気なアクティビティとなって欲しい。
# 工夫したポイント

# 機能（実装済）
- ユーザー登録/編集/削除
- テキスト・画像投稿/編集/削除
- いいね機能
- 検索機能（投稿内容）
- ハッシュタグ機能
- 非同期コメント機能
# 機能（実装予定/実装中）
- フォロー機能
- いいね機能(非同期)
- SNS認証
- SNSで共有
- 画像複数枚投稿/プレビュー
- ユーザー検索・タグずけ
- ランキング機能（いいね数）
- カテゴリー機能（国内/海外/地域別）
- Q&A機能（ダイビングについて）

# 本番環境
## デプロイ
ASW
## テストアカウント




# BD設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts
- has_many :comments
- has_one :profiles

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|pic|string|
|text|string|
|diver_lank|string|
|dive_number|integer|
### Association
- belongs_to :user


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :posts_tags
- has_many  :posts,  through:  :posts_tags

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post|reference|null: false, foreign_key: true|
|tag|reference|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|reference|null: false, foreign_key: true|
|post|reference|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user


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


