require 'json'
require 'ostruct'
require '../../Src/Persistence/db'
require "../../Src/Events/domain_event"
require "../../Src/Events/events"
require "../../Src/Api/person_api"

include Events

post '/person/:personId' do
  personId = params[:personId]

  Api::PersonCreate()

  status 200
  return "Created Person"

  rescue
  status 400
  return "The person could not be created"
end
