class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :reference_id
      t.string :reference_type
      t.integer :user_id

      t.timestamps
    end
  end
end
