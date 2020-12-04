class Service < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :transportation
  belongs_to :prefecture
  belongs_to :duration

  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :transportation_id
    validates :duration_id
  end

  validates :prefecture_id, numericality: { other_than: 0 }
end
