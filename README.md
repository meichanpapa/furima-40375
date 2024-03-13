## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| birthdate           | date       | null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column                            | Type       | Options                        |
| ----------------------------------| ---------- | ------------------------------ |
| item_name                         | string     | null: false                    |
| item_info                         | text       | null: false                    |
| category_id                       | integer    | null: false                    |
| condition_id                      | integer    | null: false                    |
| shipping_fee_responsibility_id    | integer    | null: false                    |
| origin_region_id                  | integer    | null: false                    |
| days_until_shipping_id            | integer    | null: false                    |
| sell_price                        | integer    | null: false                    |
| user                              | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| user                | reference  | null: false, foreign_key: true |
| item                | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has one :shipping_address


## shipping_addressesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | reference  | null: false, foreign_key: true |

### Association
- belongs_to :order