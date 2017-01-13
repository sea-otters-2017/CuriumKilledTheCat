class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :author_id, { null: false}
      t.integer :comment_id, { null: false}
      t.integer :vote_count
    end
  end
end
