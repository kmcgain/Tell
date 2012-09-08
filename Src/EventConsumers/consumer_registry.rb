
module EventConsumers
  class ConsumerRegistry
    @@consumersForEvent = {}

    def self.AddEventConsumer(event, consumer)
      if @@consumersForEvent.has_key?(event)
        @@consumersForEvent[event].push(consumer)
      else
        @@consumersForEvent[event] = [consumer]
      end

    end

    def self.GetConsumers()
      @@consumersForEvent
    end
  end
end