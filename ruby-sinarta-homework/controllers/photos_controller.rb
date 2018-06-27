class PhotosController < Sinatra::Base
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
erb :'./photos/index'
end

get '/:id' do
  id = params[:id].to_i
  @car = cars[id]
  # "This is a #{@make[:make]}, model is #{@make[:model}. The colour is #{@make[:colour]} "
  erb :'./photos/car'
end

end
