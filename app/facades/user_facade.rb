class UserFacade 
  def self.create_user(data)
    json = UserService.create_user(data)[:data]
    if json.has_key?(:error)
      Error.new(json)
    else
      User.new(json)
    end
  end 

  def self.get_user(data)
    json = UserService.get_user(data)[:data]
    User.new(json)
  end
  
end