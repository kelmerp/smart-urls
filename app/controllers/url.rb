post '/url' do
  @url = Url.create(:long_url => params[:url_name])
  if logged_in?
    current_user.urls << @url 
    erb :my_links
  else
    erb :index
  end
end
