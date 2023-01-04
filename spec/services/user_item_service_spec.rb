require 'rails_helper'

RSpec.describe UserItemService do
  context '#create_item(data, user_id)'
    it 'creates an item for the given user' do
      user_data = {"first_name"=>"Jenn",
              "last_name"=>"Halloran", 
              "email"=>"test9@gmail.com", 
              "password"=>"iheartcats", 
              "password_confirmation"=>"iheartcats"}
      user = UserService.create_user(user_data)

      item_data = {"name"=>"Vase", 
                "status"=> 0, 
                "clay_body"=>"Brown Speckle", 
                "glazes"=>"Rainforest x2, Snow x1", 
                "height"=> 10.0, 
                "width"=> 4.5, 
                "memo"=>"It's a little wonky", 
                "style"=>"Wheel-Thrown",
                "user_id"=> user[:data][:id]}
        item = UserItemService.create_item(item_data, user[:data][:id])

        UserService.delete_user(user[:data][:id])
    end
  context '#get_user_items(id)' do 
    it 'gets all the items associated with a given user ID' do 
      user_data = {"first_name"=>"Jenn",
              "last_name"=>"Halloran", 
              "email"=>"test10@gmail.com", 
              "password"=>"iheartcats", 
              "password_confirmation"=>"iheartcats"}
      user = UserService.create_user(user_data)

      item1 = {"name"=>"Vase", 
                "status"=> 0, 
                "clay_body"=>"Brown Speckle", 
                "glazes"=>"Rainforest x2, Snow x1", 
                "height"=> 10.0, 
                "width"=> 4.5, 
                "memo"=>"It's a little wonky", 
                "style"=>"Wheel-Thrown",
                "user_id"=> user[:data][:id]}
      UserItemService.create_item(item1, user[:data][:id])

      item2 = {"name"=>"Bowl", 
                "status"=> 1, 
                "clay_body"=>"Brown Speckle", 
                "glazes"=>"Rainforest x2, Snow x1", 
                "height"=> 4.0, 
                "width"=> 9.5, 
                "memo"=>"Cat Food Bowl", 
                "style"=>"Wheel-Thrown",
                "user_id"=> user[:data][:id]}
      UserItemService.create_item(item2, user[:data][:id])
      
      response = UserItemService.get_user_items(user[:data][:id])

      expect(response).to be_a Hash
      expect(response[:data]).to be_an Array
      expect(response[:data].length).to eq 2
      expect(response[:data].first).to have_key :id
      expect(response[:data].first).to have_key :type
      expect(response[:data].first).to have_key :attributes
      expect(response[:data].first[:attributes]).to have_key :name
      expect(response[:data].first[:attributes]).to have_key :style
      expect(response[:data].first[:attributes]).to have_key :status
      expect(response[:data].first[:attributes]).to have_key :clay_body
      expect(response[:data].first[:attributes]).to have_key :glazes
      expect(response[:data].first[:attributes]).to have_key :height
      expect(response[:data].first[:attributes]).to have_key :width
      expect(response[:data].first[:attributes]).to have_key :memo

      UserService.delete_user(user[:data][:id])
    end
  end
end