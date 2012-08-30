require_relative 'EventConsumers/person_created_consumer'

module EventConsumers
  class ConsumerRegistry
    if @@consumersForEvent == nil
      @@consumersForEvent = {}
    end

    def self.AddConsumer(event, consumer)
      if @@consumersForEvent.hasKey?(event)
        @@consumersForEvent[event].push(consumer)
      else
        @@consumersForEvent[event] = [consumer]
      end

    end

    def self.GetConsumers()
      @@consumersForEvent
    end
  end

  def self.Consume(eventToConsume)
    consumers = ConsumerRegistry::GetConsumers()

    if consumers.has_key?(eventToConsume.class)
      consumers[eventToConsume.class].each { |consumer|
        consumer.new().Receive(eventToConsume)
      }
    end
  end
end