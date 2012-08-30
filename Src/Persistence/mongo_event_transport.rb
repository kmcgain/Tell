require '../../Src/Persistence/db'
require '../../Src/object_hasher.rb'

class MongoEventTransport
  def Receive(event)
    eventHash = ObjectHasher.Hash(event)
    Db.Query()["Event"].insert(eventHash)
  end
end