require_relative 'event'

module Events
  class GeneralTellEvent < Event
    def initialize(tellTo, tellMessage)
      @tellTo = tellTo
      @tellMessage = tellMessage
    end
  end
end