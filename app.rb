require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/pet')

get('/') do
  @output_string ="Tell us what you'd like to name your pet?"
  erb(:index)
end
post('/') do
  if @@main_pet == []
    temp = params["name"]
    @@main_pet = Pet.new(temp)
  end
  erb(:pet_page)
end
post('/feed') do
  @@main_pet.feed
  erb(:feed)
end
post('/status') do
  @@main_pet.update_pet
  erb(:status)
end
post('/sleep') do
  @@main_pet.sleep
  erb(:sleep)
end
