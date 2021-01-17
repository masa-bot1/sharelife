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
① 新規登録（登録済ならログイン）※ゲストログイン機能あり

② サービス出品ページで必要事項を入力し、出品

③ 欲しいサービスをトップページから選び、購入する

# 制作背景（意図）
一人暮らしのサラリーマンやOLさんなど、仕事で忙しく家事まで手が回らない人が、気軽に家事を頼むために開発

# DEMO
### キーワード検索機能
[![Image from Gyazo](https://i.gyazo.com/f1e2b2584401b6ad094c5a070ab951c9.gif)](https://gyazo.com/f1e2b2584401b6ad094c5a070ab951c9)

### カテゴリ別検索機能
[![Image from Gyazo](https://i.gyazo.com/0bea067d48633bfa988054eced5aef20.gif)](https://gyazo.com/0bea067d48633bfa988054eced5aef20)

### 「出品者を探す」機能
[![Image from Gyazo](https://i.gyazo.com/eb463f9df97da6763bdee949b1ea7595.gif)](https://gyazo.com/eb463f9df97da6763bdee949b1ea7595)

### 出品画面
[![Image from Gyazo](https://i.gyazo.com/a99a6a70fc68e9b8e25763f0d7eb3695.gif)](https://gyazo.com/a99a6a70fc68e9b8e25763f0d7eb3695)

### 購入画面
[![Image from Gyazo](https://i.gyazo.com/05d024bfc6b5141962fd68f119c2fb0b.gif)](https://gyazo.com/05d024bfc6b5141962fd68f119c2fb0b)

### サービス詳細ページ
[![Image from Gyazo](https://i.gyazo.com/b7b1a6bf531f4182a55f2d2dac3c4540.gif)](https://gyazo.com/b7b1a6bf531f4182a55f2d2dac3c4540)

### ユーザー詳細ページ
[![Image from Gyazo](https://i.gyazo.com/92ef518aeed3a0058c1d2402b926954d.gif)](https://gyazo.com/92ef518aeed3a0058c1d2402b926954d)

### いいね機能
[![Image from Gyazo](https://i.gyazo.com/294e2c0bced6d94174933945e737b880.gif)](https://gyazo.com/294e2c0bced6d94174933945e737b880)


# 洗い出した要件
- ユーザー管理機能（新規登録、ログイン、ログアウト）
- サービス出品、一覧表示、詳細表示、編集・削除機能
- サービス購入機能
- カテゴリー別検索機能、キーワード検索機能
- 「出品者を探す」機能
- いいね機能
- ユーザー詳細表示、編集機能
- 横スクロール機能（サービス一覧、ユーザー一覧）

# 工夫したポイント
- 欲しいサービスを探しやすくするため、キーワード・カテゴリ別・出品者別に検索できるようにした。
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
- サービスの評価がないため、サービスの質がわかりにくい。
- 出品者の情報が不十分。

## 今後実装したい機能
- サービスの評価機能
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