class TodoAPI < Sinatra::Base
  use Rack::MethodOverride
  include ERB::Util

  # TODO: 필요없을 지도..
  helpers do
    def html_escape_params(*texts)
      texts.map do |text|
        html_escape(text)
      end
    end
  end

  get '/' do
    Todo.all.to_json
    redirect '/todos'
  end

  # 목록 화면
  get '/todos' do
    erb :index, locals: {todos: Todo.where(status: 0), index: true}
  end

  # 작성 화면
  get '/todos/new' do
    erb :new, locals: {index: false} do
      erb :_form, locals: {edit: false}
    end
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
    erb :edit, locals: {index: false} do
      erb :_form, locals: {todo: todo, edit: true}
    end
  end

  # 편집
  put '/todos/:id' do
    todo = Todo.find(params[:id])
    title = html_escape(params[:title])
    description = html_escape(params[:description])
    todo.update_attributes!(
      title: title,
      description: description
    )
    redirect '/'
  end

  put '/todos/:id/:status' do
    todo = Todo.find(params[:id])
    case params[:status]
    when 'done'
      todo.update_attributes!(status: 1)
    when 'not-yet'
      todo.update_attributes!(status: 0)
    end
  end

  # 삭제
  delete '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    redirect '/'
  end

  get '/todos/' do
    redirect '/todos'
  end
end
