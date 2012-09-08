require 'rubygems'
require 'sinatra'

require_relative '../../Api/person_api'

get '/' do
  haml :index
end

post '/person/create/' do
  emailAddress = params[:email]

  Api::Person::PersonCreate(emailAddress)

  status 200
  return "Created Person"
end

post '/person/tell/' do
  tellTo = params[:tellTo]
  tellMessage = params[:tellMessage]

  Api::Person::Tell(tellTo, tellMessage)

  status 200
  return "Successful Tell"
end