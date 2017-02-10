class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(title: params[:title], description: params[:description],price: params[:price], user_id: session[:user_id], start_date: params[:start_date], end_date: params[:end_date])
    create_tags(space)
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    @tags = Tag.all
    session[:space_id] = params[:id]
    erb :'spaces/space_page'
  end

  get '/spaces' do
    if (params[:selected_date]) && (params[:selected_date] != "")
      @selected_date = string_to_date(params[:selected_date])
    end
    @spaces = Space.all
    @tags = Tag.all
    @filename = session[:filename]
    erb :'spaces/index'
  end

end
