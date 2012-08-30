require_relative 'consumer_registry'

module EventConsumers
  class EventConsumer
    def self.consumes(event)
      ::EventConsumers::ConsumerRegistry::AddEventConsumer(event, self)
    end
  end
end