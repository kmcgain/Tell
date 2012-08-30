require '../../Src/Persistence/db'
require "../../Src/Events/events"

include Events

module Api
  def TellPerson(personId, tell)
    validatePostTell(personId, tell)

    DomainEvent.Raise(SimpleTellEvent.new(personId, tell.Message))

    return true
  end

  private
  def validatePostTell(personId, tell)
    personExists = Db.Query()["Person"].find_one("PersonId" => personId) != nil

    if !personExists || tell.Message == nil
      status 400
    end
  end
end

