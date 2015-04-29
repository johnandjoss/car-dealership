require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')


get('/') do
  erb(:index)
end

get('/all_vehicles') do
  @vehicles = Vehicle.all()
  erb(:all_vehicles)
end

get('/all_vehicles/new') do
  erb(:vehicle_form)
end

post('/all_vehicles') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  erb(:success)
end

get('/all_vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id"))
  erb(:vehicle)
end
