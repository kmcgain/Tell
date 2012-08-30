require 'mongo'

class Db
  @@conn = Mongo::Connection.new
  @@db = @@conn['tell']

  def self.Query
    @@db
  end
end