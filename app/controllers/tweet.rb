get '/tweets/new' do
  erb :'tweets/new'
end

post '/tweets' do
  Tweet.create(params[:content])
  redirect '/users/:id'
end
