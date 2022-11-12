class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/todos' do
    todo = Todo.all
    todo.to_json
  end

  get '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.to_json
  end

  post '/todos' do
    todo = Todo.create(
      text: params[:text],
      category: params[:category],
      done: params[:done],
    )
    todo.to_json
  end

  patch '/todos/:id' do
    todo = Todo.find(params[:id])
    todo = Todo.update(
      done: params[:done],
    )
    todo.to_json
  end

  delete '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    todo.to_json
  end

end
