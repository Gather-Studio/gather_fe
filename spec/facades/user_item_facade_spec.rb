require 'rails_helper'

RSpec.describe UserItemFacade do 
  describe '#get_user_items(id)' do 
    it 'returns item objects that are associated with the given user' do 
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"test6@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

              item1 = {"name"=>"Vase", 
                "status"=> 0, 
                "clay_body"=>"Brown Speckle", 
                "glazes"=>"Rainforest x2, Snow x1", 
                "height"=> 10.0, 
                "width"=> 4.5, 
                "memo"=>"It's a little wonky", 
                "style"=>"Wheel-Thrown",
                "user_id"=> user.id}
      UserItemService.create_item(item1, user.id)

      item2 = {"name"=>"Bowl", 
                "status"=> 1, 
                "clay_body"=>"Brown Speckle", 
                "glazes"=>"Rainforest x2, Snow x1", 
                "height"=> 4.0, 
                "width"=> 9.5, 
                "memo"=>"Cat Food Bowl", 
                "style"=>"Wheel-Thrown",
                "user_id"=> user.id}
      UserItemService.create_item(item2, user.id)

        items = UserItemFacade.get_user_items(user.id)
        expect(items).to be_all(Item)
        expect(items.count).to eq(2)

        UserService.delete_user(user.id)

    end
  end
end