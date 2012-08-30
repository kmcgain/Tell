require "rspec"
require "../Src/events"
require '../Src/event_consumers'

$receiveCalled = false

module EventConsumers
  class PersonCreatedConsumer
    # Change implementation of consumer
    def Receive(personCreatedEvent)
      $receiveCalled = true
    end
  end
end


describe "Can Consume Events" do

  it "should find event consumers and consume" do

    event = Events::PersonCreatedEvent.new("id")
    EventConsumers::Consume(event)

    $receiveCalled.should eql true
  end
end