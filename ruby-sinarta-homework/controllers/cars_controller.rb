class CarsController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views")}

  configure :development do
  register Sinatra::Reloader
end

cars = [
  {
  id:0,
  make: "BMW",
  Model: "X6",
  colour: "White"

},
{
  id:1,
  make: "Mercedes",
  model: "C63",
  colour: "Blue"
},
{
  id:2,
  make: "Tesla",
  model: "S",
  colour: "Red"
},
{
  id:3,
  make: "Seat",
  model: "Leon FR",
  colour: "Black"
}
]


get '/' do
  @cars = cars
erb :'/cars/index'
end

get '/cars/:id' do
  id = params[:id].to_i
  @car = cars[id]
  # "This is a #{@car[:make]}, model is #{@car[:model}. The colour is #{@car[:colour]} "
  erb :'/cars/show'
end

end
