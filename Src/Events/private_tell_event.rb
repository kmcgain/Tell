require_relative 'event'

module Events
  class PrivateTellEvent < Event
    def initialize(personId, message)
      @personId = personId
      @message = message
    end
  end
end