# このアプリについて
## selfPRとは
「selfPR」とは、自己PRを投稿し、その内容に対して添削をしてもらうことができるアプリです。

## 概要
アプリ名：selfPR

URL：https://selfpr.herokuapp.com/

使用言語：Ruby on Rails、jQuery

主な機能：ユーザー登録、自己PR投稿、コメント、いいね、フォロー、詳細検索

作業人数：1人

作業日数：18日間

## このアプリを作ろうと思ったきっかけ
2点あります。

- プログラミングスクールのカリキュラムをベースとした投稿系アプリの作成をすることで、Railsの知識定着を図りました。
- 自己PRの添削を受けたいが、それを頼める環境がない人でも、添削を受けられる環境を用意したかったためです。

## Usage

```
$ git clone https://github.com/shoji621/selfPR.git
$ cd idea_space
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
👉http://localhost:3000/
```

## 具体的な機能紹介
#### ・ ユーザー登録 
```
deviseを用いて、ユーザー登録機能の実装を行った。
ログインしていないユーザーはログインページに遷移される。
```
<img src="https://user-images.githubusercontent.com/57927432/72968978-fa1b2e80-3e07-11ea-843b-8db46ad1f722.png" width="500px">

#### ・ 自己PR投稿

```
ヘッダー右上の「新規投稿」ボタンを押すと自己PRを投稿できるページに遷移します。
志望業界
志望職種
現職
自己PR本文

を全て記入し、「投稿する」ボタンを押すと投稿ができます。
```

<img src="https://user-images.githubusercontent.com/57927432/72970299-b118a980-3e0a-11ea-8606-4c5cc97a11df.png" width="500px">

#### ・ コメント投稿

```
自己PRが「受付中」ステータスのものに対して、コメントを投稿することができます。このコメント欄に自己PRの添削内容を記入して下さい。
```

<img src="https://user-images.githubusercontent.com/57927432/72970997-20db6400-3e0c-11ea-8e54-7b465e078cb8.png" width="500px">

#### ・ 解決済みステータス
```
添削のフィードバックをもらい、自分の納得のいく自己PRに編集することができたら、「解決済」にしてコメントの受付を終了することができます。
右下の「解決済みにする」ボタンを押すとステータスが「受付中」から「解決済」に変化し、コメントができなくなります。
```

<img src="https://user-images.githubusercontent.com/57927432/72971306-cbec1d80-3e0c-11ea-93ca-33715069ecee.png" width="500px"> <img src="https://user-images.githubusercontent.com/57927432/72971363-e3c3a180-3e0c-11ea-8f30-3beaf21bf2b5.png" width="500px">

#### ・ いいね

```
ハートマークを押すと「いいね」の処理がされます。
いいねした自己PRの一覧は

　右上のアカウント名をクリック
＞「お気に入り投稿一覧」をクリック
すると確認できます。
```

<img src="https://user-images.githubusercontent.com/57927432/73044751-5afd4200-3eae-11ea-999f-1312419e546e.png" width="500px">

#### ・ フォロー

```
自分以外のユーザーの名前をクリックするとそのユーザーの投稿一覧ページに遷移することができます。
そこで、右上にある「フォローする」ボタンを押すとそのユーザーが自分のフォロー一覧に追加されます。
各ユーザーの「フォロー」「フォロワー」の一覧を確認したい時は、左上にある「フォロー」「フォロワー」の文字をクリックして下さい。
```

<img src="https://user-images.githubusercontent.com/57927432/73044789-a152a100-3eae-11ea-8613-1c75d24ce9df.png" width="500px"> <img src="https://user-images.githubusercontent.com/57927432/73045017-892f5180-3eaf-11ea-972d-df05ba8e918e.png" width="500px">

#### ・ 詳細検索

```
ヘッダーの「詳細検索」ボタンをクリックすると、詳細検索ページへ遷移します。
ここでは、各項目で条件を絞って自己PRを検索することができます。
```

<img src="https://user-images.githubusercontent.com/57927432/73045046-a9f7a700-3eaf-11ea-8ebd-12aeb0733c01.png" width="500px">

## 工夫して実装した機能
#### ・ 解決済みステータスの切り替え
解決済みステータスの更新を`posts/solveds_controller.rb`内のupdateアクションで定義しました。このように実装することで、自己PR自体の更新（`posts_controller.rb`内のupdateアクション）と区別して呼び出すことが可能となりました。

```controllers/posts/solveds_controller.rb
class Posts::SolvedsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    @post.update_solved_true
    redirect_to post_path(@post.id)
  end
end
```

```views/posts/show.html.haml
- if current_user.id == @post.user_id
  = link_to "解決済にする", posts_solved_path(@post), controller: :PostsSolveds, action: :update, method: :patch, class: :form__btn__solved
```

#### ・ コメント削除の非同期通信
非同期通信で投稿されたコメントそれぞれに動的idを付与することにより、各投稿に削除ボタンを実装しました。

```controllers/comments_controller.rb
class CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @id_name = "#comment-#{@comment.id}"
    if @comment.destroy
    else
      flash.now[:alert] = 'コメントを削除できませんでした。'
    end
  end
```

```views/shared/_comment.html.haml
.content{id: "comment-#{comment.id}"}
-# (省略)
```

```views/comments/destroy.js.haml
$('#{@id_name}').remove();
```

## DB設計図
<img src="https://user-images.githubusercontent.com/57927432/73047526-6f930780-3eb9-11ea-8173-c41bf928eafe.png" width="1200px">
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false, unique: true|
#### Association
- has_many :posts
- has_many :comments
- has_many :favolites
- has_many :favorite_posts, through: :favorites, source: :post
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

### postsテーブル
|Column|Type|Options|
|------|----|-------|
|industry_id|integer|null: false|
|hopejob_id|integer|null: false|
|nowjob_id|integer|null: false|
|text|text|null: false|
|solved_status|boolean| { solved: true, unsolved: false }|
|user_id|reference|null: false, foreign_key: true|
#### Association
- belongs_to_active_hash :industry
- belongs_to_active_hash :hopejob
- belongs_to_active_hash :nowjob
- has_many :comments
- belongs_to :user
- has_many :favorites, foreign_key: 'Post_id', dependent: :destroy
- has_many :favorite_users, through: :favorites, source: :user


### favorites(user_posts)テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :post

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :post

### relations(following_followers)テーブル
|Column|Type|Options|
|------|----|-------|
|following_id|integer||
|follower_id|integer||
#### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"