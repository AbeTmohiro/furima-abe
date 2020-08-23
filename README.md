# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Heroku apps:info
Git URL:        https://git.heroku.com/furima-abe.git
Web URL:        https://furima-abe.herokuapp.com/

* Database creation
## DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false,index: true |
| email              | devise のデフォルト   | null: false             |
| encrypted_password | devise のデフォルト   | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

- has_many :items
- has_many :item_transactions

## addresses table

| Column               | Type    | Options           |
|----------------------|---------|-------------------|
| postal_code          | integer | null: false       |
| prefecture           | integer | null: false       |
| city                 | string  | null: false       |
| address              | string  | null: false       |
| building             | string  |                   |
| phone_number         | string  | null: false       |
| item_transaction_id  | integer | foreign_key: true |

### Association

- belongs_to :item_transaction

## items table

| Column                              | Type          | Options           |
|-------------------------------------|---------------|-------------------|
| name                                | string        | null: false       |
| price                               | integer       | null: false       |
| info                                | text          | null: false       |
| scheduled_delivery_id(acitve_hash)  | integer       | null: false       |
| shipping_fee_status_id(acitve_hash) | integer       | null: false       |
| prefecture_id(acitve_hash)          | integer       | null: false       |
| sales_status_id(acitve_hash)        | integer       | null: false       |
| category_id(acitve_hash)            | integer       | null: false       |
| user                                | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :item_transaction

## item_transactions table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
