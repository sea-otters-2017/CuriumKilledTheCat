class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.integer :author_id, { null: false}
      t.integer :question_id, { null: false}
      t.integer :vote_count
    end
  end
end
