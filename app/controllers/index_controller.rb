get '/' do
  page = params[:page] || 1
  @questions = Question.paginate(:page => page)
  erb :index
end
