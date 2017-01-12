class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :author_id, { null: false}
      t.integer :post_id, { null: false}
      t.index :author_id
      t.index :post_id

      t.timestamps null: false
    end
  end
end
