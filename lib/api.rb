class TodoAPI < Sinatra::Base
  use Rack::MethodOverride
  include ERB::Util

  get '/' do
    Todo.all.to_json
    redirect '/todos'
  end

  # 목록 화면
  get '/todos' do
    erb :index, locals: {todos: Todo.all}
  end

  # 작성 화면
  get '/todos/new' do
    erb :new
  end

  # 작성
  post '/todos' do
    title = html_escape(params[:title])
    description = html_escape(params[:description])
    Todo.create!(title: title, description: description)
    redirect '/todos'
  end

  # 편집 화면
  get '/todos/:id/edit' do
    todo = Todo.find(params[:id])
    erb :edit, locals: {todo: todo}
  end

  # 편집
  put '/todos/:id' do
    todo = Todo.find(params[:id])
    title = html_escape(params[:title])
    description = html_escape(params[:description])
    todo.update_attributes(
      title: title,
      description: description
    )
    redirect '/'
  end

  # 삭제
  delete '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    redirect '/'
  end

end
