class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
