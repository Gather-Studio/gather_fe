require 'rails_helper'


RSpec.describe SessionService do
  context '#login(user_data)' do
    it 'authenticates a user and creates a session if information is valid' do
      user_data = {"first_name"=>"Jenn",
                    "last_name"=>"Halloran", 
                    "email"=>"test7@gmail.com", 
                    "password"=>"iheartcats", 
                    "password_confirmation"=>"iheartcats"}
      UserService.create_user(user_data)

      login_data = {"email"=>"test7@gmail.com",
                    "password"=> "iheartcats"}
      
      response = SessionService.create_session(login_data)
      
      expect(response).to be_a Hash
      expect(response[:data]).to be_a Hash
      expect(response[:data]).to have_key :id
      expect(response[:data]).to have_key :type
      expect(response[:data]).to have_key :attributes
      expect(response[:data][:attributes]).to have_key :email
      expect(response[:data][:attributes]).to have_key :first_name
      expect(response[:data][:attributes]).to have_key :last_name

      UserService.delete_user(response[:data][:id])
    end
    
    it 'returns a generic error if information is invalid' do
      user_data = {"first_name"=>"Jenn",
                    "last_name"=>"Halloran", 
                    "email"=>"test8@gmail.com", 
                    "password"=>"iheartcats", 
                    "password_confirmation"=>"iheartcats"}
      user_data = UserService.create_user(user_data)

      login_data = {"email"=>"halloran2@udel.edu",
                    "password"=> "ihatecats"}
      
      response = SessionService.create_session(login_data)
      
      expect(response).to be_a Hash
      expect(response[:data]).to be_a Hash
      expect(response[:data]).to have_key :error
      expect(response[:data][:error]).to eq("Those credentials are incorrect. Try again!")

      UserService.delete_user(user_data[:data][:id])
    end
  end 
end