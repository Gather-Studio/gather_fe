class SessionService 
    def self.connection 
    Faraday.new(url: 'https://gatherbe.fly.dev')
    # Faraday.new(url: 'http://localhost:3001')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_session(data)
    response = connection.post("/api/v1/sessions", data.to_json, {'Content-Type'=>'application/json'})
    get_json(response)
  end
end