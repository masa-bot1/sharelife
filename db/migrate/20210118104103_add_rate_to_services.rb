class AddRateToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :rate, :float
  end
end
