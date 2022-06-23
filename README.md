## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true | 
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    | 
| image            | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| delivery_pay     | integer    | null: false                    |
| delivery_source  | integer    | null: false                    |
| delivery_time    | integer    | null: false                    |
| price            | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true | 
| user        | references | null: false, foreign_key: true |
| destination | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination



## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    | 
| prefecture    | integer    | null: false                    |
| manicipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
