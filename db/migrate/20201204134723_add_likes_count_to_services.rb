class AddLikesCountToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :likes_count, :integer
  end
end
