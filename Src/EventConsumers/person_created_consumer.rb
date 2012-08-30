require_relative 'event_consumer'
require_relative '../Events/person_created_event'

a = Events

module EventConsumers

  class PersonCreatedConsumer < EventConsumer
    consumes ::Events::PersonCreatedEvent

    def Receive(personCreatedEvent)

    end
  end
end