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

# 本番環境
## デプロイ
AWS,Nginx,Capistrano

# BD設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string|
|text|string|
|diver_lank|string|
|dive_number|integer|
### Association
- has_many  :posts
- has_many  :comments
- has_one   :likes
- has_many  :liked_posts, through: :likes, source: :post
- has_many  :active_follows, class_name: 'Relationship',
                            foreign_key: 'following_id',
                            dependent: :destroy
- has_many  :followings, through: :active_follows, source: :followed
- has_many  :passive_follows, class_name: 'Relationship',
                            foreign_key: 'followed_id',
                            dependent: :destroy
- has_many  :followers, through: :passive_follows, source: :following


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|date|date|null: false|
|title|string|null: false|
|text|string|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many   :comments, foreign_key: :post_id, dependent: :destroy
- has_many   :images
- has_many   :likes, foreign_key: :post_id, dependent: :destroy
- has_many   :liked_users, through: :likes, source: :user
- has_many   :posts_tags
- has_many   :tags,  through:  :posts_tags


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :post


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
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



