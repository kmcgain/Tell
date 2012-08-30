require 'rubygems'
require 'sinatra'
require 'json'
require 'ostruct'
require_relative '../Persistence/db'
require_relative '../Events/domain_event'
require_relative '../events'
require_relative 'exceptions'

include Events

module Api
  class Person
    def self.PersonCreate(personId)
      validateCreatePerson(personId)

      DomainEvent.Raise(PersonCreatedEvent.new(personId))

      return true
    end

    private
    def self.validateCreatePerson(personId)
      personExists = Db.Query()["Person"].find_one("PersonId" => personId) != nil

      if personExists
        raise PersonExistsException
      end
    end
  end
end