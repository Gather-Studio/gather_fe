class UserService 
  def self.connection 
    Faraday.new(url: 'https://gatherstudiobe.herokuapp.com')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user(data)
    formatted_data = {"user"=> data}
    response = connection.post('/api/v1/users', formatted_data.to_json, {'Content-Type'=>'application/json'})
    get_json(response)
  end
end