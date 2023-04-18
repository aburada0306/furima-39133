## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------  |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |
| chinese_first      | string | null: false             |
| chinese_last       | string | null: false             |
| kana_first         | string | null: false             |
| kana_last          | string | null: false             |
| birth              | date   | null: false             |

### Association

- has_many :items
- has_many :orders


##  itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :order



## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
