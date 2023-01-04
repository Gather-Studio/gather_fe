class UserItemService
  def self.connection 
    # Faraday.new(url: 'https://gatherbe.fly.dev')
    Faraday.new(url: 'http://localhost:3001')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_item(data, user_id)
    formatted_data = {"item"=> data}
    response = connection.post("/api/v1/users/#{user_id}/items", formatted_data.to_json, {'Content-Type'=>'application/json'})
    get_json(response)
  end

  def self.get_user_items(id)
    response = connection.get("api/v1/users/#{id}/items")
    get_json(response)
  end
end