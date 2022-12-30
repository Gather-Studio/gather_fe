class UserService 
  def self.connection 
    Faraday.new(url: 'https://gatherbe.fly.dev')
    # Faraday.new(url: 'http://localhost:3000')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user(data)
    formatted_data = {"user"=> data}
    response = connection.post("/api/v1/users", formatted_data.to_json, {'Content-Type'=>'application/json'})
    get_json(response)
  end

  def self.get_user(id)
    response = connection.get("/api/v1/users/#{id}")
    get_json(response)
  end

  def self.delete_user(id)
    response = connection.delete("/api/v1/users/#{id}")
  end
end