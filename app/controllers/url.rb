post '/url' do
  @url = Url.create(:long_url => params[:url_name])
  erb :index
end
