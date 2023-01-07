class SessionService 
  def self.create_session(data)
    response = BaseService.connection.post("/api/v1/sessions", data.to_json, {'Content-Type'=>'application/json'})
    BaseService.get_json(response)
  end
end