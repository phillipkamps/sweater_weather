class ErrorSerializer
  def self.serialized_json(error_obj)
    {
      status: error_obj.status,
      message: error_obj.message,
      code: error_obj.code
    }
  end
end
