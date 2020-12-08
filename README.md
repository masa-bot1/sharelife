# アプリケーション名

## SHARELIFE

# アプリケーション概要
ユーザーが掃除などの家事をフリマのようにサービスとして出品したり、購入出来るアプリケーション。

# URL

# テスト用アカウント

# 利用方法
① 新規登録（登録済ならログイン）

② サービス出品ページで必要事項を入力し、出品

③ 欲しいサービスをトップページから選び、購入する

# 制作背景（意図）
一人暮らしのサラリーマンやOLさんなど、仕事で忙しく家事まで手が回らない人が、気軽に家事を頼むために開発

# DEMO
## トップページ
https://gyazo.com/2acb310014961b4495b39e9c830fb1b4

## 新規登録画面

## ユーザー詳細画面

## いいね機能


# 洗い出した要件
- ユーザー管理機能
- サービス出品、一覧表示、詳細表示、編集・削除機能
- サービス購入機能
- カテゴリー別検索機能
- いいね機能
- ユーザー詳細表示、編集・削除機能
- フォロー・フォロワー機能
- 一覧スライド表示機能

# 実装した機能についてのGIFと説明
- カテゴリー別検索機能
カテゴリーをクリックすると、そのカテゴリーのサービスが表示される

- いいね機能
ログインしたユーザーが、気に入ったサービスに「いいね」をつけることが出来る

# 実装予定の機能
- ユーザー詳細表示、編集・削除機能
- フォロー・フォロワー機能
- 一覧スライド表示機能

# 工夫したポイント
- 欲しいサービスを探しやすくするため、トップページからカテゴリ別に検索できるようにした。

- 出品者のサービスの質の判断材料として、出品者の販売実績とランク付けを実装した。

# 使用技術（開発環境）
HTML・CSS・Ruby・Ruby on Rails・JavaScript・GitHub・jquery

# ER図URL
https://gyazo.com/b29c4e0b87661dd00faab0ce4db7c8a3

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :services
- has_many :orders

## services テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| transportation_id | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| duration_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user    | references  | null: false, foreign_key: true |
| service | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :service
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## likes テーブル

| Column     | Type     | Options |
| ---------- | -------- | ------- |
| user_id    | integer  |         |
| service_id | integer  |         |

### Association

- belongs_to :user
- belongs_to :service