class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services
  has_many :orders
  has_many :likes, dependent: :destroy
  has_many :liked_services, through: :likes, source: :service

  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }, on: :create
  with_options presence: true do
    validates :password_confirmation, on: :create
    validates :nickname
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
  validates :category_id, numericality: { other_than: 1 }
end
