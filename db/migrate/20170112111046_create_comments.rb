class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :author_id, {null: false}
      t.index :author_id

      t.timestamps null:false
    end
  end
end
