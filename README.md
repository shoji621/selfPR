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



# SelfPR DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false, unique: true|
### Association
- has_many :posts
- has_many :comments
- has_many :favolites
- has_many :favorite_posts, through: :favorites, source: :post
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|industry|string||
|hopejob|string||
|nowjob|string||
|text|text|null: false|
|solved_status|boolean| { solved: true, unsolved: false }|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- has_many :favorites, foreign_key: 'Post_id', dependent: :destroy
- has_many :favorite_users, through: :favorites, source: :user


## favorites(user_posts)テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## relations(following_followers)テーブル
|Column|Type|Options|
|------|----|-------|
|following_id|integer||
|follower_id|integer||
### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"
