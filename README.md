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
| birth_year          | integer    | null: false                    |
| birth_month         | integer    | null: false                    |
| birth_day           | integer    | null: false                    |

### Association
- has_many :items
- has_many :orders
- has_one :shipping_address


## itemsテーブル

| Column                            | Type       | Options                        |
| ----------------------------------| ---------- | ------------------------------ |
| item_name                         | string     | null: false                    |
| item_info                         | text       | null: false                    |
| category                          | integer    | null: false                    |
| condition                         | integer    | null: false                    |
| shipping_fee_responsibility       | integer    | null: false                    |
| origin_region                     | integer    | null: false                    |
| days_until_shipping               | integer    | null: false                    |
| sell_price                        | integer    | null: false                    |
| user                              | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| buy_item_price      | integer    | null: false                    |
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
| phone_number        | integer    | null: false                    |
| user                | reference  | null: false, foreign_key: true |
| order               | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order