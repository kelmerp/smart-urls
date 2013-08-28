###### GET ROUTES ######
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create' do
  erb :create
end

get '/my_links' do
  erb :my_links
end

get '/logout' do
  session.clear
  erb :goodbye
end
get '/realsite/:id' do
  @url = Url.find(params[:id])
  @url.increment_counter
  @url.save
  redirect to "#{@url.long_url}"
end

###### POST ROUTES ######
post '/create' do
  User.create(params[:user])
  @user = User.authenticate(params[:user])
  if @user != nil
    session[:user_id] = @user.id
    puts session
    redirect to "/"
  else
    redirect to "/"
  end
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user != nil
    session[:user_id] = @user.id
    puts session
    redirect to "/"
  else
    redirect to "/"
  end
end
