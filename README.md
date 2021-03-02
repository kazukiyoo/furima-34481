# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type         | Options                      |
| ---------------- | -------------| ---------------------------- |
| user             | references   | null: false, foreign_key:true|
| product_name     | string       | null: false                  |
| price            | string       | null: false                  |
| description      | text         | null: false                  |
| category         | string       | null: false                  |
| status           | string       | null: false                  |
| area             | string       | null: false                  |
| burden           | string       | null: false                  |
| days_to_delivery | integer      | null: false                  |
| image            | ActiveStorage| null: false                  |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column       | Type         | Options                      |
| ------------ | -------------| ---------------------------- |
| item         | references   | null: false, foreign_key:true|
| user         | references   | null: false, foreign_key:true|
| postal_code  | string       | null: false                  |
| prefectures  | string       | null: false                  |
| municipality | string       | null: false                  |
| address      | string       | null: false                  |
| phone_number | string       | null: false                  |

### Association

- belongs_to :users
- belongs_to :items