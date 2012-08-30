require 'rubygems'
require 'sinatra'
require_relative 'Controllers/person'
require '../../Src/Persistence/mongo_event_transport'

set :haml, :format => :html5
set :views, settings.root + '/Views'

DomainEvent.RegisterTransports([MongoEventTransport.new])