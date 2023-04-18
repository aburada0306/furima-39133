## users テーブル

<<<<<<< Updated upstream
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
=======
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
>>>>>>> Stashed changes


##  itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
<<<<<<< Updated upstream
| postage_id         | integer    | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_id        | integer    | null: false                    |
=======
| postage            | string     | null: false                    |
| content            | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| city               | string     | null: false                    |
| time               | string     | null: false                    |
| image              | string     | null: false                    |
>>>>>>> Stashed changes
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
<<<<<<< Updated upstream
- has_one   :order



## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
=======
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
>>>>>>> Stashed changes
| user           | references | null: false, foreign_key: true |

### Association

<<<<<<< Updated upstream
- belongs_to :item
- belongs_to :user
- has_one    :address
=======
- belongs_to :user
>>>>>>> Stashed changes

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
<<<<<<< Updated upstream
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
=======
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
>>>>>>> Stashed changes
