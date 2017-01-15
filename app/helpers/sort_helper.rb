helpers do
  def sort_best_first(answers)
    answers = answers.map{|answer| answer}
    answers.each_with_index{ |answer, index|
      if answer.is_best
        best = answers.delete_at(index)
        answers.unshift(best)
      end
    }
  end

  def sort_by_votes(posts)
    posts.sort_by{|post| - post.vote_count }
  end
end
