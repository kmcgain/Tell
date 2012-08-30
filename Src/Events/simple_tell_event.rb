require_relative 'event'

module Events
  class SimpleTellEvent < Event
    def initialize(personId, message)
      @personId = personId
      @message = message
    end
  end
end