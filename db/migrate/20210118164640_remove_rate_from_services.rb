class RemoveRateFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :rate, :float
  end
end
