class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :author_id, { null: false }
      t.text :content
      t.integer :question_id
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
