class RemovePostIdAddCommentIdQuestionIdAnswerId < ActiveRecord::Migration
  def change
    remove_column :votes, :post_id, :integer
    add_column :votes, :comment_id, :integer
    add_column :votes, :question_id, :integer
    add_column :votes, :answer_id, :integer
  end
end
