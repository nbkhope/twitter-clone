get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  erb :'tweets/new'
end

post '/tweets' do
  @user = User.find_by(id: session[:user_id])
  @user.tweets << Tweet.create(params[:tweet])
  redirect "/users/#{@user.id}"
end
