require 'aws-sdk'
require 'ostruct'
require '../../Src/Events/events'
require_relative 'db'

class AwsSQSRetriever
  def initialize()
    sqs = AWS::SQS.new(
        :access_key_id => "AKIAJ5SJRF4EG2VK7QVA",
        :secret_access_key => "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")

    @eventImmediateQueue = sqs.queues.create("TellEventImmediateQueue")
  end

  def PollForever()
    @eventImmediateQueue.poll do |msg|

      jsonBody = JSON.parse(msg.body)
      body = OpenStruct.new(jsonBody)

      foundEvent = Db.Query()["Event"].find(EventId => body.EventId)

      if foundEvent = nil or foundEvent.IsConsumed return

      event = Events.const_get(body.Event.Type)

      event.Consume()

      Db.Query()["Event"].Update({"_id" => foundEvent._id, "IsConsumed" => false})

    end
  end
end