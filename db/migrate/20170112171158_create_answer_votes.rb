class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.integer :author_id, null: false
      t.integer :answer_id, null: false
      t.integer :vote_count, null: false

      t.timestamps null: false
    end
  end
end
