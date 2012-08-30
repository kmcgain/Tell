require_relative 'event'

module Events
  class PersonCreatedEvent < Event
    def initialize(personId)
      @personId = personId
    end
  end
end