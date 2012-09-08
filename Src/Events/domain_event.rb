require 'uuidtools'

class DomainEvent
  def self.RegisterTransports(transports)
    @@transports = transports
  end

  def self.Raise(event)
    id = UUIDTools::UUID.timestamp_create.to_i

    consumeableEvent = ConsumeableEvent.new(id, event)

    @@transports.each do |transport|
       transport.Receive(event)
    end
  end

  class ConsumeableEvent
    def initialize(id, event)
      @EventId = id
      @Event = event
      @IsConsumed = false
    end
  end
end