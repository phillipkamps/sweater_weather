class Error
  attr_reader :code, :status, :message

  def initialize(code, status, message)
    @code = code
    @status = status
    @message = message
  end
end
