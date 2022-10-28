# テーブル設計


## users テーブル

| Columu             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| name               | string  | null: false              |
| profile            | text    | null: false              |
| occupation         | text    | null: false              |
| position           | text    | null: false              |

### Association

- has_many :purchase_records
- has_many :items

## items テーブル

| Columu             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category           | text       | null: false                    |
| item_condition     | text       | null: false                    |
| delivery_charge    | text       | null: false                    |
| delivery_area      | text       | null: false                    |
| delivery_date      | text       | null: false                    |
| price              | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_records

## purchase_records テーブル

| Columu             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| delivery_address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses


## delivery_addresses テーブル

| Columu             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| post_code          | string  | null: false              |
| prefectures        | string  | null: false              |
| municipalities     | string  | null: false              |
| house_number       | text    | null: false              |
| building           | text    |                          |
| telephone_number   | text    | null: false              |

### Association

- belongs_to :purchase_record
