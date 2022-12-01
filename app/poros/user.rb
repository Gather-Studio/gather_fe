class User 
  attr_reader :first_name, :last_name, :email, :id

  def initialize(data)
    @id = data[:id].to_i
    @first_name = data[:attributes][:first_name]
    @last_name = data[:attributes][:last_name]
    @email = data[:attributes][:email]
  end

end