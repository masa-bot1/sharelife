class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text    :title,       null: false
      t.text    :content,     null: false
      t.float   :rate
      t.references :user,     null: false, foreign_key: true
      t.references :service,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
