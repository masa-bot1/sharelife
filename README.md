# アプリ名

### SHARELIFE（シェアライフ）

# 概要
ユーザーが掃除などの家事をフリマのようにサービスとして出品したり、購入出来るアプリケーション。

# 本番環境

### URL
http://54.168.91.44

### テスト用アカウント
購入者用


- メールアドレス: :ken@com
- パスワード: kenken1


購入用カード情報
- 番号：4242424242424242
- 期限：3月23年
- セキュリティコード：123


出品者用
- メールアドレス名: tom@com
- パスワード: tomtom1

# 利用方法
① 新規登録（登録済ならログイン）

② サービス出品ページで必要事項を入力し、出品

③ 欲しいサービスをトップページから選び、購入する

# 制作背景（意図）
一人暮らしのサラリーマンやOLさんなど、仕事で忙しく家事まで手が回らない人が、気軽に家事を頼むために開発

# DEMO
### カテゴリ別検索機能
[![Image from Gyazo](https://i.gyazo.com/751a6424f9758e9af477b520b7ff2e1d.gif)](https://gyazo.com/751a6424f9758e9af477b520b7ff2e1d)

### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/2df3e334cfae555cd37fa2bebc69ef7a.gif)](https://gyazo.com/2df3e334cfae555cd37fa2bebc69ef7a)

### 出品画面
[![Image from Gyazo](https://i.gyazo.com/01d4fbe933e937b7832024adb6fc2109.gif)](https://gyazo.com/01d4fbe933e937b7832024adb6fc2109)

### 購入画面
[![Image from Gyazo](https://i.gyazo.com/d910bbc384f824edd81987a43b4ed716.gif)](https://gyazo.com/d910bbc384f824edd81987a43b4ed716)

### ユーザー詳細ページ
[![Image from Gyazo](https://i.gyazo.com/0927342ad679008cc68d861fc63cfc2a.gif)](https://gyazo.com/0927342ad679008cc68d861fc63cfc2a)

### ユーザー編集機能
[![Image from Gyazo](https://i.gyazo.com/085c09ea0756bd37660c632e46151ce0.gif)](https://gyazo.com/085c09ea0756bd37660c632e46151ce0)

### いいね機能
[![Image from Gyazo](https://i.gyazo.com/3b5d423ad46eae90359fcc0809c3e8a8.gif)](https://gyazo.com/3b5d423ad46eae90359fcc0809c3e8a8)


# 洗い出した要件
- ユーザー管理機能
- サービス出品、一覧表示、詳細表示、編集・削除機能
- サービス購入機能
- カテゴリー別検索機能
- キーワード検索機能
- いいね機能
- ユーザー詳細表示、編集機能
- 一覧スライド表示機能

# 工夫したポイント
- 欲しいサービスを探しやすくするため、トップページからカテゴリ別に検索できるようにした。
- 出品者のサービスの質の判断材料として、ユーザー詳細ページに出品者の販売実績とランク付けを実装した。

# 使用技術（開発環境）
## バックエンド
Ruby、Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript,JQuery

## データベース
MySQL,SequelPro,MariaDB

## インフラ
AWS(EC2),Capistrano

## Webサーバ（本番環境）
Nginx

## アプリケーションサーバ（本番環境）
Unicorn

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
## 課題
- 見た目をもっとわかりやすくする必要がある。
- ユーザーの販売実績がトップページで表示できていない。

## 今後実装したい機能
- ユーザーの販売実績をトップページに表示
- キーワード検索機能（現段階では検索フォームのみ実装）
- フォロー・フォロワー機能

# ER図
[![Image from Gyazo](https://i.gyazo.com/9cd67920eaddca7b12e20a56b2a578a3.png)](https://gyazo.com/9cd67920eaddca7b12e20a56b2a578a3)

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