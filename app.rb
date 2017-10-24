require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

post "/restaurants/create" do
  Restaurant.create(name: params[:restaurant_name], description: params[:restaurant_description])
  redirect to("/")
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

get '/restaurant/new' do
  erb :new
end

get '/about' do
  "<h1>About our service</h1>"
end
