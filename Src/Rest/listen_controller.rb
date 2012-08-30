require 'rubygems'
require 'sinatra'
require 'json'
require 'ostruct'
require '../../Src/Persistence/db'
require "../../Src/Events/events"
require "../../Src/Api/listen_api"

include Events


post '/listen/:personId' do
  personId = params[:personId]

  jsonBody = JSON.parse(request.body.read.to_s)
  body = OpenStruct.new(jsonBody)

  Api::Listen()

  status 200
  return "Success"

  rescue

  status 400
  return "Could not listen"
end


