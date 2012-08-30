require_relative "Tell"

class Person

  def initialize name
    @name = name
    @unreadTells = Array.new
  end

  def Tell message
    if message.class == String
      @unreadTells << Tell.new(message)
    else
      @unreadTells << message
    end
  end

  def UnreadTells
    return @unreadTells
    @unreadTells.clear()
  end
end