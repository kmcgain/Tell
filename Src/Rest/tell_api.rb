require 'rubygems'
require 'sinatra'
require 'json'
require 'ostruct'
require '../../Src/Persistence/db'
require "../../Src/Events/events"

include Events

get '/' do
  'Welcome to Tell'
end

post '/tell/:personId' do
  personId = params[:personId]

  jsonBody = JSON.parse(request.body.read.to_s)
  body = OpenStruct.new(jsonBody)

  validatePostTell(personId, body)

  DomainEvent.Raise(SimpleTellEvent.new(personId, body.Message))

  status 200
  return "Success"
end


def validatePostTell(personId, tell)
  personExists = Db.Query()["Person"].find_one("PersonId" => personId) != nil

  if !personExists || tell.Message == nil
    status 400
  end
end

