class Like < ApplicationRecord
  belongs_to :service
  belongs_to :user
  validates_uniqueness_of :service_id, scope: :user_id
end
