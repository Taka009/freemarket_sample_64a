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
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|postage|references|null: false, foreign_key: true|
|shipping_day|references|null: false, foreign_key: true|
|price|integer|null: false|
|evaluation|references|null: false, foreign_key: true|
|status|references|null: false|
|dealing_stage|references|foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- belongs_to :postage
- belongs_to :shipping_day
- belongs_to :user
- has_many :images
- has_many :goods
- belongs_to :evaluation

## conditionテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## postageテーブル
|Column|Type|Options|
|------|----|-------|
|send|string|null: false|
### Association
- has_many :items
- has_many :shipping_method

## shipping_methodテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
### Association
- has_many :postage

## categoriesテーブル
|Column|Type|Options|
|------|----|------|
|path||
|name|string|
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
|postalcodes|integer||
|Prefectures|string||
|Municipalities|string||
|numbers|string||
|buildings|string||
|emergency contact|integer|unique: true|
### Association
- belongs_to :user

## goodテーブル
|Column|Type|Option|
|------|----|------|
|user|reference|foreign_key: true, null: false|
|item|reference|foreign_key: true, null: false|
|good|null: false|
### Association
- belongs_to :user
- belongs_to :item

## shipping_dayテーブル
|Column|Type|Option|
|------|----|------|
|shipping_day|null: false|
### Association
- has_many :items

## evaluationテーブル
|Column|Type|Option|
|------|----|------|
|evaluation|null: false|
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
|number|integer|null: false|
|deadline_month|integer|null: false|
|deadline_year|integer|null: false|
|Security_code|integer|null: false|
### Association
- belongs_to :user