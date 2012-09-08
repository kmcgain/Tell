require_relative '../Src/event_consumers'

class TestDomainEventTransport
  def initialize()
    @events = []
  end

  def Receive(event)
    @events.push(event)

    EventConsumers::Consume(event)
  end
end