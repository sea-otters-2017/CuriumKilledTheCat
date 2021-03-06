
post '/questions/:question_id/votes' do
  @author = User.find_by_id(session[:user_id])
  @question = Question.find_by_id(params[:question_id])

  unless @author && @question
    return status 404 if request.xhr?
    return erb :'404'
  end

  if @author.voted_questions.include? @question
    @vote = QuestionVote.find_by(author_id: @author.try(:id), question_id: @question.try(:id))
    if @vote.vote_count == params[:vote_count].to_i
      @vote.destroy
    else
      @vote.update(:vote_count => params[:vote_count])
    end
  else
    @vote = QuestionVote.new(author_id: @author.try(:id), question_id: @question.try(:id), vote_count: params[:vote_count])
  end

  @vote.save if @vote.valid?

  return @question.vote_count.to_s if request.xhr?
  redirect "/questions/#{@quesion.id}"  
end

 
post '/answers/:answer_id/votes' do
  @author = session_user
  @answer = Answer.find_by_id(params[:answer_id])
  @question = @answer.try(:question)

  unless @author && @answer
    return status 404 if request.xhr?
    return erb :'404'
  end

  if @author.voted_answers.include? @answer
    @vote = AnswerVote.find_by(author_id: @author.try(:id), answer_id: @answer.try(:id))
    if @vote.vote_count == params[:vote_count].to_i
      @vote.destroy
    else
      @vote.update(:vote_count => params[:vote_count])
    end
  else
    @vote = AnswerVote.new(author_id: @author.try(:id), answer_id: @answer.try(:id), vote_count: params[:vote_count])
  end

  @vote.save if @vote.valid?

  return @answer.vote_count.to_s if request.xhr?
  redirect "/questions/#{@quesion.id}"
end


post '/comments/:comment_id/votes' do
  @author = User.find_by_id(session[:user_id])
  @comment = Comment.find_by_id(params[:comment_id])
  @question = @comment.try(:answer).try(:question)

  unless @author && @comment
    return status 404 if request.xhr?
    return erb :'404'
  end
  
  if @author.voted_comments.include? @comment
    @vote = CommentVote.find_by(author_id: @author.try(:id), comment_id: @comment.try(:id))
    if @vote.vote_count == params[:vote_count].to_i
      @vote.destroy
    else
      @vote.update(:vote_count => params[:vote_count])
    end
  else
    @vote = CommentVote.new(author_id: @author.try(:id), comment_id: @comment.try(:id), vote_count: params[:vote_count])
  end

  @vote.save if @vote.valid?

  return @comment.vote_count.to_s if request.xhr?
  redirect "/questions/#{@quesion.id}"
end

