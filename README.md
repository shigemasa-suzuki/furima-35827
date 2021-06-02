# README

# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | NOT: NULL   |
| email    | string | NOT: NULL   |
| encrypted_password | string | NOT: NULL   |
| nickname | string | NOT: NULL   |
| birthday | string | NOT: NULL   |

### Association

- belongs_to :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | NOT: NULL    |
| info   | text   |NOT: NULL    |
| category | string | NOT: NULL  |
| status   | string   |NOT: NULL    |
| shipping fee | string | NOT: NULL  |
| shipping area   | string   |NOT: NULL    |
| day to ship | string | NOT: NULL  |
| price | string | NOT: NULL  |
### Association

- belongs_to :addresses
- belongs_to :users

## orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| seller   | string | NOT: NULL   |
| status   | text | NOT: NULL   |
| shipping fee | string | NOT: NULL |
| shipping area   | string | NOT: NULL |
| day to ship | string  |  NOT: NULL   |


### Association

- belongs_to :addresses
- belongs_to :users

## addresses テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| info    | string | NOT: NULL   |
| card period | string | NOT: NULL |
| security code | string | NOT: NULL      |
| postal code   | string   | NOT: NULL    |
| prefecture | string  |  NOT: NULL     |
| city   | string   | NOT: NULL    |
| address | string  |  NOT: NULL     |
| buliding name   | string   | NOT: NULL    |
| phone number | string  |  NOT: NULL     |


### Association

- belongs_to :orders
- belongs_to :items