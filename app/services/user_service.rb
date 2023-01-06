class UserService 
  def self.create_user(data)
    formatted_data = {"user"=> data}
    response = BaseService.connection.post("/api/v1/users", formatted_data.to_json, {'Content-Type'=>'application/json'})
    BaseService.get_json(response)
  end

  def self.get_user(id)
    response = BaseService.connection.get("/api/v1/users/#{id}")
    BaseService.get_json(response)
  end

  def self.delete_user(id)
    response = BaseService.connection.delete("/api/v1/users/#{id}")
  end
end