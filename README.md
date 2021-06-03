# README

# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first name     | string | null: false   |
| last name     | string | null: false   |
| first name kana    | string | null: false   |
| last name     | string | null: false   |
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
| seller   | string | null: false   |
| category_id| integer | null: false  |
| status_id  | integer   |null: false  |
| shipping_fee_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| day_to_ship_id | integer  |  null: false   |
| price | integer | null: false  |
### Association

- belongs_to :user
  has_many :orders

## orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id   | integer | null: false |
| item_id   | integer | null: false |

### Association

- has_one :addresses
- belongs_to :user
  belongs_to :item
 
## addresses テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal code   | string   | null: false    |
| prefecture_id | integer  |  null: false     |
| city   | string   | null: false    |
| address | string  |  null: false     |
| buliding name   | string   |       |
| phone number | string  |  null: false     |
| order | references |      |


### Association

- belongs_to :order
- belongs_to :item