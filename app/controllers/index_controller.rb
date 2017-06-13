get '/' do
  page = params[:page] || 1
  @questions = Question.paginate(:page => page).order('id DESC')
  erb :index
end
