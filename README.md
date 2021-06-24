# README

# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first_name     | string | null: false   |
| last_name     | string | null: false   |
| first_name_kana    | string | null: false   |
| last_name_kana     | string | null: false   |
| email    | string | null: false unique: true   |
| encrypted_password | string | null: false   |
| nickname | string | null: false   |
| birthday | date | null: false   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false    |
| info   | text   |null: false    |
| category_id| integer | null: false  |
| status_id  | integer   |null: false  |
| shipping_fee_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| day_to_ship_id | integer  |  null: false   |
| price | integer | null: false  |
| user | references | foreign_key: true    |
### Association

- belongs_to :user
  has_one :order

## orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | foreign_key: true   |
| item | references | foreign_key: true   |

### Association

- has_one :address
- belongs_to :user
  belongs_to :item
 
## addresses テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code   | string   | null: false    |
| shipping_area_id   | integer | null: false |
| city   | string   | null: false    |
| address | string  |  null: false     |
| buliding_name   | string   |       |
| phone_number | string  |  null: false     |
| order | references |  foreign_key: true     |


### Association

- belongs_to :order

rails g migration AddUserIdToAddresses user:references