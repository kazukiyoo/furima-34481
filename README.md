# テーブル設計

## users テーブル

| Column         | Type   | Options                   |
| ---------------| ------ | ------------------------- |
| surname        | string | null: false               |
| first_name     | string | null: false               |
| surname_kana   | string | null: false               |
| first_name_kana| string | null: false               |
| nickname       | string | null: false               |
| email          | string | null: false, unique: true |
| password       | string | null: false               |
| birthday       | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type         | Options                      |
| ------------------- | -------------| ---------------------------- |
| user                | references   | null: false, foreign_key:true|
| product_name        | string       | null: false                  |
| price               | integer      | null: false                  |
| description         | text         | null: false                  |
| category_id         | integer      | null: false                  |
| status_id           | integer      | null: false                  |
| prefectures_id      | integer      | null: false                  |
| burden_id           | integer      | null: false                  |
| days_to_delivery_id | integer      | null: false                  |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type         | Options                      |
| --------------- | -------------| ---------------------------- |
| postal_code     | string       | null: false                  |
| prefectures_id  | integer      | null: false                  |
| municipality    | string       | null: false                  |
| address         | string       | null: false                  |
| building_name   | string       | null: false                  |
| phone_number    | string       | null: false                  |

### Association

- belongs_to :user
- belongs_to :item

## user_items テーブル

| Column          | Type         | Options                      |
| --------------- | -------------| ---------------------------- |
| user            | references   | null: false, foreign_key:true|
| items           | references   | null: false, foreign_key:true|

### Association

- belongs_to :user
- belongs_to :item