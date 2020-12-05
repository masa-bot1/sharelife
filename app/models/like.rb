class Like < ApplicationRecord
  belongs_to :service, counter_cache: :likes_count
  belongs_to :user
end
