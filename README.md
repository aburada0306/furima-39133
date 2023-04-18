## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| chinese_first      | string | null: false |
| chinese_last       | string | null: false |
| kana_first         | string | null: false |
| kana_last          | string | null: false |
| birth              | date   | null: false |

### Association

- has_one  :card
- has_one  :address
- has_many :items
- has_many :comments


##  itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| postage            | string     | null: false                    |
| content            | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| city               | string     | null: false                    |
| time               | string     | null: false                    |
| image              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | string     | null: false                    |
| limit_year     | integer    | null: false                    |
| limit_month    | integer    | null: false                    |
| card_code      | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user