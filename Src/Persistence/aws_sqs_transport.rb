require '../../Src/object_hasher.rb'
require 'aws-sdk'

# User: Tell

class AwsSqsTransport
  def initialize()
    sqs = AWS::SQS.new(
        :access_key_id => "AKIAJ5SJRF4EG2VK7QVA",
        :secret_access_key => "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")

    @eventImmediateQueue = sqs.queues.create("TellEventImmediateQueue")
  end

  def Receive(event)
    eventHash = ObjectHasher.Hash(event)
    @eventImmediateQueue.send_message(eventHash.to_json)
  end
end