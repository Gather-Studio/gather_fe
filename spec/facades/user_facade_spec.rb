require 'rails_helper'

RSpec.describe UserFacade do 
  describe '#create_user' do
    it 'creates a user object' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"halloran77@udel.edu", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

        expect(user).to be_a(User)

        UserService.delete_user(user.id)
    end
  end
end