
## Name
MovieLovers

## Overview
映画のレビューが投稿できるアプリ

## Heroku URL
https://movie-review-aplication.herokuapp.com

## testアカウント
email:    test@gmail.com
password: testtest

## Description

ユーザーログインした後に、新規で映画を投稿することが出来ます。
またすでにある映画の画像を押すとレビューの投稿が出来ます。
映画は誰でも編集と削除が出来ますが、レビューは投稿者本人しか、編集と削除ができません。
映画はタイトルと監督名で検索でき、ajaxで実装しています。

## Demo

## ユーザーログイン画面
[![Image from Gyazo](https://i.gyazo.com/4905ea4f0943a11b1f3408314fc2d79d.gif)](https://gyazo.com/4905ea4f0943a11b1f3408314fc2d79d)

## 新規で映画を作成する
[![Image from Gyazo](https://i.gyazo.com/d922d2ca2dcd34228c1c2ff125190c8c.gif)](https://gyazo.com/d922d2ca2dcd34228c1c2ff125190c8c)

## レビューを投稿する
[![Image from Gyazo](https://i.gyazo.com/7c494c3a166ad45cdb48264751536dde.gif)](https://gyazo.com/7c494c3a166ad45cdb48264751536dde)

## 映画を検索する
[![Image from Gyazo](https://i.gyazo.com/4eb960a2d72ebc83e2ca53ccc21d9aa4.gif)](https://gyazo.com/4eb960a2d72ebc83e2ca53ccc21d9aa4)


## DB設計

## moviesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|director|string|null: false|
|image|string|null: false|
### Association
- has_many :reviews
- has_many :users, through: :reviews

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
### Association
- has_many :reviews
- has_many :movies, through: :reviews

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|rating|string|null: false|
|movie_id|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :movie
- belongs_to :user
