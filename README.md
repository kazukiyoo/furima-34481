# テーブル設計

## users テーブル

| Column            | Type   | Options                   |
| ------------------| ------ | ------------------------- |
| surname           | string | null: false               |
| first_name        | string | null: false               |
| surname_kana      | string | null: false               |
| first_name_kana   | string | null: false               |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many :item
- has_many :user_item

## items テーブル

| Column              | Type         | Options                      |
| ------------------- | -------------| ---------------------------- |
| user                | references   | null: false, foreign_key:true|
| product_name        | string       | null: false                  |
| price               | integer      | null: false                  |
| description         | text         | null: false                  |
| category_id         | integer      | null: false                  |
| status_id           | integer      | null: false                  |
| prefecture_id       | integer      | null: false                  |
| burden_id           | integer      | null: false                  |
| days_to_delivery_id | integer      | null: false                  |

### Association

- belongs_to :user
- has_one :user_item

## purchases テーブル

| Column          | Type         | Options                      |
| --------------- | -------------| ---------------------------- |
| user_item       | references   | null: false, foreign_key:true|
| postal_code     | string       | null: false                  |
| prefecture_id   | integer      | null: false                  |
| municipality    | string       | null: false                  |
| address         | string       | null: false                  |
| building_name   | string       |                              |
| phone_number    | string       | null: false                  |

### Association
belongs_to :user_item

## user_items テーブル

| Column          | Type         | Options                      |
| --------------- | -------------| ---------------------------- |
| user            | references   | null: false, foreign_key:true|
| item            | references   | null: false, foreign_key:true|

### Association

- belongs_to :user
- belongs_to :item
  has_one :purchase