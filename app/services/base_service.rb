class BaseService 
    def self.connection 
    Faraday.new(url: 'https://gatherbe.fly.dev')
    # Faraday.new(url: 'http://localhost:3001')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end