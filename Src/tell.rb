class Tell
  def initialize(message)
    @message = message

    @read = false
  end

  def to_s
    return @message
  end

  def Read
    @read = true
    return @message
  end

  def Read?
    return @read
  end
end