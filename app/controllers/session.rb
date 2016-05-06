# Same as /sessions/new
get '/login' do
	erb :'/users/login'
end

# Same as post /sessions
post '/login' do
	user = User.find_by(email: params[:user][:email])
	password = params[:user][:password]

	if user && User.authenticate(params[:user][:email], password)
		session[:user_id] = user.id
		redirect '/'
	else
		redirect '/login'
	end
end

# Same as delete /sessions/:id
get '/logout' do
	session.clear

	redirect '/login'
end

# Alias for /login
get '/sessions/new' do
	redirect '/login'
end
