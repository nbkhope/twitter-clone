get '/tweets' do
  @all_tweets = Tweet.all
  erb :'tweets/index'
end
