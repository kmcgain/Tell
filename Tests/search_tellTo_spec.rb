require "rspec"
require "../Src/events"
require '../Src/event_consumers'
require 'rubberband'
require_relative '../Src/events/domain_event'
require '../Tests/test_domain_event_transport'
require_relative '../Src/Events/person_created_event'
require_relative '../Src/Events/private_tell_event'

module EventConsumers
  class PersonCreatedConsumer
    # Change implementation of consumer
    def Receive(personCreatedEvent)
      $receiveCalled = true
    end
  end
end


describe "Can Search Events" do


  before :each do
    DomainEvent.RegisterTransports([TestDomainEventTransport.new()])
    @elasticContainer = ElasticSearch.new('http://127.0.0.1:9200', :index => "twitter", :type => "tweet")
  end

  it "find person to match" do
    DomainEvent.Raise(Events::PersonCreatedEvent.new("test_person"))

    DomainEvent.Raise(Events::PrivateTellEvent.new("test_person", "message"))

    @elasticContainer.search("personId:test_person").should != nil
  end
end