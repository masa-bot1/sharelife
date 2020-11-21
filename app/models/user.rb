class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  with_options presence: true do
    validates :password_confirmation
    validates :nickname
    validates :name,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
