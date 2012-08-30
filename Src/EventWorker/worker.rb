require 'rubygems'
require 'daemons'
require '../../Src/Persistence/aws_sqs_retriever'
class Worker
  def Run()
    AwsSQSRetriever.new().PollForever()
  end
end

worker = Worker.new()
worker.Run()