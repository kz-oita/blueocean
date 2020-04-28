# アプリ名
Blue Ocean
# テストアカウント
メールアドレス  : test@gmail.com
パスワード      : 111111
# 概要
スキューバダイビングのSNSアプリ
# 制作背景
趣味のスキューバダイビングをもっと多くの人が好きになって欲しいと思い開発しました。
ダイビングでは毎回ログというものを付けます。
自分のスキルアップのためのデータの管理、思い出のために書きますが、面倒であるため疎かになっている現状です。
SNSに共有することで、ログつけが楽しくなり、またユーザー同士が繋がることで、限定的となっているダイビング仲間が増え、ダイビングがより人気なアクティビティとなって欲しいと思います。

# 機能（実装済）
- ユーザー登録/編集/削除
- テキスト・画像投稿/編集/削除
- 画像複数枚投稿/プレビュー
- いいね機能(非同期)
- 検索機能（投稿内容）
- ハッシュタグ機能
- 非同期コメント機能
- フォロー機能
# 機能（実装予定/実装中）
- SNS認証
- SNSで共有
- ユーザー検索・タグずけ
- ランキング機能（いいね数）
- カテゴリー機能（国内/海外/地域別）
- Q&A機能（ダイビングについて）

# 本番環境
## デプロイ
ASW

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


