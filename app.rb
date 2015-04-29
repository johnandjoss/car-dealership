require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')


get('/') do
  erb(:index)
end

get('/all_dealers/') do
  @dealerships = Dealership.all()
  erb(:all_dealers)
end

get('/all_dealers/new') do
  erb(:dealerships_form)
end

get('/all_dealers') do
  @dealerships = Dealership.all()
  erb(:all_dealers)
end

post('/all_dealers') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:success_deal)
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

get('/all_dealers/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/all_dealers/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership_vehicle_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @vehicle = Vehicle.new(make, model, year)
  @vehicle.save()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end
