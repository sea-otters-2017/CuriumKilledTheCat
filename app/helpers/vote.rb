helpers do
  def downvote(vote_type, post_type, post_id)
    if session_user
      vote = vote_type.find_by(author_id: session_user_id, "#{post_type}_id".to_sym => post_id)
      return 'downvote' if vote && vote.vote_count == -1
    end
    ''
  end

  def upvote(vote_type, post_type, post_id)
    if session_user
      vote = vote_type.find_by(author_id: session_user_id, "#{post_type}_id".to_sym => post_id)
      return 'upvote' if vote && vote.vote_count == 1
    end
    ''
  end
end
