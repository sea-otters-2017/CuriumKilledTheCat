class AddIndexes < ActiveRecord::Migration
  def change
    add_index(:answers, :author_id)
    add_index(:answers, :question_id)
    add_index(:answer_votes, [:author_id, :answer_id], unique: true)
    add_index(:question_votes, [:author_id, :question_id], unique: true)
    add_index(:comment_votes, [:author_id, :comment_id], unique: true)
  end
end
