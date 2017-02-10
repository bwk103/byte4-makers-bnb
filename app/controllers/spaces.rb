class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(title: params[:title], description: params[:description],price: params[:price], user_id: session[:user_id], start_date: params[:start_date], end_date: params[:end_date])
    Tag.create(name: params[:pet_friendly], space_id: space.id )
    Tag.create(name: params[:house], space_id: space.id )
    Tag.create(name: params[:has_a_pool], space_id: space.id )
    Tag.create(name: params[:wifi], space_id: space.id )
    Tag.create(name: params[:flat], space_id: space.id )
    Tag.create(name: params[:central], space_id: space.id )
    Tag.create(name: params[:has_a_fireplace], space_id: space.id )
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    @unavailable_dates = Booking.all(:space_id => @space.id, :status => "Confirmed")
    session[:space_id] = params[:id]
    erb :'spaces/space_page'
  end

  get '/spaces' do
    if (params[:selected_date]) && (params[:selected_date] != "")
      @selected_date = Date.strptime(params[:selected_date], '%Y-%m-%d')
    end
    @spaces = Space.all
    @tags = Tag.all
    @filename = session[:filename]
    erb :'spaces/index'
  end

end
