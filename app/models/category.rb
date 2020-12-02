class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '料理' },
    { id: 3, name: '洗濯・乾燥・衣類等たたみ' },
    { id: 4, name: 'DIY（家具等組み立て）' },
    { id: 5, name: '掃除' },
    { id: 6, name: 'インテリアコーディネート' },
    { id: 7, name: 'ペットの世話' },
    { id: 8, name: '買い物' },
    { id: 9, name: '送迎' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :services
  has_many :users
end
