require_relative 'event_consumer'
require_relative '../Events/person_created_event'

a = Events

module EventConsumers

  class GeneralTellConsumer < EventConsumer
    consumes ::Events::GeneralTellEvent

    def GeneralTellConsumer(elasticSearchClient)
      @elasticSearchClient = elasticSearchClient
    end

    def Receive(generalTellEvent)
      individual = getPersonFromTellTo(generalTellEvent.tellTo)

      if individual is nil
        findPeopleAndAssociate(generalTellEvent)
      else
        DomainEvent.Raise(Events::PrivateTellEvent.new (individual.Id, generalTellEvent.TellMessage))
      end
    end

    private
    def findPeopleAndAssociate(event)
      results = @elasticSearchClient.search("personId:#{event.TellTo}")

      people = Db.Query()["Person"].find_many("PersonId" => {results.select(personId)})
      for result in results
        person = people where Id == result.id
        DomainEvent.Raise(PersonMatchedMessageEvent.new(person, event.TellTo, event.TellMessage))
      end
    end

    private
    def getPersonFromTellTo(tellTo)
      Db.Query()["Person"].find_one("PersonId" => tellTo)
    end
  end
end