###### GET ROUTES ######
get '/' do
  session.clear
  erb :index
end

get '/login' do
  erb :login
end

get '/create' do
  erb :create
end

get '/logged_in_page' do
  erb :logged_in_page
end

###### POST ROUTES ######
post '/create' do
  User.create(params[:user])

  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user != nil
    session[:user] = @user.id
    puts session
    redirect to "/logged_in_page"
  else
    redirect to "/"
  end
end
