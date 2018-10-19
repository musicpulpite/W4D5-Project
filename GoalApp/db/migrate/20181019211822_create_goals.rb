class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :body
      t.integer :user_id, null: false
      t.timestamps
      t.index :user_id
    end
  end
end
