require 'rails_helper'


RSpec.describe UserService do
  context '#create_user(user_data)' do
    it 'creates a new user and returns the users information' do
      user_data = {"first_name"=>"Jenn",
                    "last_name"=>"Halloran", 
                    "email"=>"halloran2@udel.edu", 
                    "password"=>"iheartcats", 
                    "password_confirmation"=>"iheartcats"}
      response = UserService.create_user(user_data)
      
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
  end

  context '#get_user(user_id)' do 
    it 'returns a users info from their id' do 
      user_data = {"first_name"=>"Jenn",
        "last_name"=>"Halloran", 
        "email"=>"halloran19@udel.edu", 
        "password"=>"iheartcats", 
        "password_confirmation"=>"iheartcats"}
        user = UserService.create_user(user_data)

      response = UserService.get_user(user[:data][:id])
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
  end
end