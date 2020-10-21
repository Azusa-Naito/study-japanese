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

# アプリケーションの説明・概要
これは、日本語を勉強したい外国人向けのアプリケーションです。
以下主な機能です。
- 講師は日本語の授業の動画を投稿でき、学生はそれを見ることができる
- 動画にはレビュー機能がついており、講師の講義動画の質向上にもつながる
- 動画にはコメント機能もついており、視聴した学生は講師に授業の質問もできる
- 学生も講師も短文投稿ができる
- お互いにフォローでき、仲間を見つけ、交流できる。

# 目的
独学をしてつまづいてしまう学生が、学習を続けられるように作成しました。
日本語がわかりやすく解説してある、ともに日本語を勉強する仲間が見つけられる、という点で学習のモチベーションアップにつなげます。

# 使い方
講師は日本語についての講座動画を撮り、学生がそれを見ることができます。

# テーブル設計

## teachers テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| nickname     | string     | null: false                    |
| email        | string     | null: false                    |
| password     | string     | null: false                    |
| last_name    | string     | null: false                    |
| first_name   | string     | null: false                    |
| last_name_h  | string     | null: false                    |
| first_name_h | string     | null: false                    |
| birthday     | date       | null: false                    |

### Association

- has_many :posts
- has_many :tweets


## students テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| nickname     | string     | null: false                    |
| email        | string     | null: false                    |
| password     | string     | null: false                    |
| last_name    | string     | null: false                    |
| first_name   | string     | null: false                    |
| birthday     | date       | null: false                    |

### Association

- has_many :tweets


## tweets テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | string     | null: false       |
| teacher   | references | foreign_key: true |
| student   | references | foreign_key: true |

### Association

- belongs_to :teacher
- belongs_to :student


## posts テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| movie     |            | null: false       |
| title     | string     | null: false       |
| text      | text       | null: false       |
| teacher   | references | foreign_key: true |
| student   | references | foreign_key: true |

### Association

- belongs_to :teacher