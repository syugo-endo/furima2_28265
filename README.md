# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| birthday        | string | null: false |
### Association

- has_many :items
- has_many :buys
- has_one :deliver_address


## deliver_address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address1       | string     | null: false                    |
| address2       | string     |                                |
| telephone      | integer    | null: false, unique: true      |
| user_id        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :buy

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| seler_user_id | references | null: false, foreign_key: true |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| price         | integer    | null: false                    |
| text          | text       | null: false                    |
| shipping_date | integer    |                                |
| ship_from     | integer    | null: false                    |
| name          | string     | null: false                    |
### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :deliver_address

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
