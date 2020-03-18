# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|fast_name|string|null: false|
|kana_lastname|string|null: false|
|kana_fastname|string|null: false|
|birthday|integer|null: false|
|phone|integer|null: false|
|profile|text| |
|image|string| |
|sales|integer| |
|sex|string|null: false|
### Association
- has_one  :place
- has_many :items
- has_many :goods
- has_many :evaluations, through: :evalutaions_users
- has_many :credits

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|user|references|null: false foreign_key: true|
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|postage|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|
|price|integer|null: false|
|condition|integer|null: false|
|dealing_stage|integer|null: false|
|shipping_day|integer|null: false|

### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :postage
- belongs_to :user
- belongs_to :evaluation
- has_many :images
- has_many :goods
- enum condition: [ :unused, :near_unused, :no_scratch, :slightly_scratched, :scratched, :shoddy]
- enum shipping_day: [ :1_2, :2_3, :4-7]
- enum dealing_stage: [ :exhibiting, :trading, :sold]

## postageテーブル
|Column|Type|Options|
|------|----|-------|
|path||
|send|string|null: false|
### Association
- has_many :items
- has_ancestry

## categoriesテーブル
|Column|Type|Options|
|------|----|------|
|path||
|name|string|null: false|
### Association
- has_many:items
- has_ancestry

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## placeテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false foreign_key: true|
|postalcodes|integer|null: false|
|Prefectures|string|null: false|
|Municipalities|string|null: false|
|numbers|string|null: false|
|buildings|string||
|emergency contact|integer|unique: true|
### Association
- belongs_to :user

## goodテーブル
|Column|Type|Option|
|------|----|------|
|user|reference|foreign_key: true, null: false|
|item|reference|foreign_key: true, null: false|
|good|string|null: false|
### Association
- belongs_to :user
- belongs_to :item

## evaluationテーブル
|Column|Type|Option|
|------|----|------|
|evaluation|string|null: false|
### Association
- has_many :users, through: :evalutaions_users
- has_many :items

## evaluations_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|
### Association
- belongs_to :evaluation
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|name|string|null: false|
### Association
- belongs_to :item, dependent: :destroy

## creditテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false foreign_key: true|
|number|integer|null: false|
|deadline_month|integer|null: false|
|deadline_year|integer|null: false|
|Security_code|integer|null: false|
### Association
- belongs_to :user