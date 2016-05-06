# Show the form to create a new account
get '/users/new' do
	#@user = User.new

	erb :'users/new'
end

get '/register' do
	redirect '/users/new'
end

# Creates a user account
post '/users' do
	@user = User.new(params[:user])

	if @user.save
		# If account was created successfully, redirect to login page
		redirect "/login"
	else
		erb :'users/new'
	end
end

# Show a user's profile
get '/users/:id' do
	@user = User.find(params[:id])

	erb :'users/show'
end

# Show the form to edit a user's profile
get '/users/:id/edit' do
	@user = User.find(params[:id])

	erb :'users/edit'
end

# Route to update a user's profile
put 'users/:id' do
	@user = User.find(params[:id])
	@user.assign_attributes(params[:user])

	if @user.save
		# If saved succesfully, go back to user's profile page
		redirect "/users/#{@user.id}"
	else
		erb :'/users/edit'
	end
end

# Route to delete a user
delete '/users/:id' do
	@user = User.find(params[:id])

	@user.destroy

	redirect '/'
end

get '/follow/:id' do
	@me = User.find_by(id: session[:user_id])
	@user = User.find_by(id: params[:id])
	@user.followers << @me

	redirect "/users/#{@user.id}"
end
