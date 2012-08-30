require 'rubygems'
require 'sinatra'
require 'json'
require 'ostruct'
require '../../Src/Persistence/db'
require "../../Src/Events/events"

include Events

module Api
  def Listen(personId)
    return nil
  end
end