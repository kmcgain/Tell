require "sinatra"
require "../Api/tell_api"
require "../Api/person_api"
require "../../Src/Events/domain_event"
require "../../Src/Persistence/mongo_event_transport"
require "../../Src/Persistence/aws_sqs_transport"

DomainEvent.RegisterTransports([MongoEventTransport.new, AwsSqsTransport.new])
