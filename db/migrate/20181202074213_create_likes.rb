class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :favorite, foreign_key: { to_table: :microposts }

      t.timestamps
      
    end
  end
end
