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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    | 
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_pay_id    | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true | 
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination


## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    | 
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
