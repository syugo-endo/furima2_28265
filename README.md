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
| birthday        | date   | null: false |
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
| user           | references | null: false, foreign_key: true |
### Association

- belongs_to :item

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| seller_user   | references | null: false, foreign_key: true |
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
- has_one :deliver_address

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
