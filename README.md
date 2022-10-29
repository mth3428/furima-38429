# テーブル設計


## users テーブル

| Columu             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| family_name        | string  | null: false              |
| first_name         | string  | null: false              |
| family_name_kana   | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday_id        | date    | null: false              |

### Association

- has_many :purchase_records
- has_many :items

## items テーブル

| Columu             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Columu             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address


## delivery_addresses テーブル

| Columu             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| post_code          | string     | null: false              |
| delivery_area_id   | integer    | null: false              |
| municipalities     | string     | null: false              |
| house_number       | string     | null: false              |
| building           | string     |                          |
| telephone_number   | string     | null: false              |
| purchase_records   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record
