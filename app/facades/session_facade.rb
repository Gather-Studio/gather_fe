class SessionFacade 
  def self.create_session(data)
    json = SessionService.create_session(data)[:data]
    if json.has_key?(:error)
      Error.new(json)
    else
      User.new(json)
    end
  end
end