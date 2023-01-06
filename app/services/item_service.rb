class ItemService

  def self.create_item(data, user_id)
    formatted_data = {"item"=> data}
    response = BaseService.connection.post("/api/v1/users/#{user_id}/items", formatted_data.to_json, {'Content-Type'=>'application/json'})
    BaseService.get_json(response)
  end

  def self.get_user_items(id)
    response = BaseService.connection.get("api/v1/users/#{id}/items")
    BaseService.get_json(response)
  end
end