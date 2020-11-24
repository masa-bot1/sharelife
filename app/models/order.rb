class Order < ApplicationRecord
  has_one :address
  belongs_to :service
end
