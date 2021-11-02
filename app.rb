require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all

  erb :index
end

get '/restaurants/:id' do
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)
  
  erb :show
end

# create rest
post "/restaurants" do
  restaurant = Restaurant.new({
    name: params[:name],
    city: params[:city]
  })
  restaurant.save

  redirect '/'
end