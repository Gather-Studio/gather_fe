require 'rails_helper'

RSpec.describe UserFacade do 
  describe '#create_user' do
    it 'creates a user object' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"test3@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

        expect(user).to be_a(User)

        UserService.delete_user(user.id)
    end
    it 'creates an error if data is invalid' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"test4@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"ihatecats"}

        user = UserFacade.create_user(user_data)

        expect(user).to be_a(Error)
    end
  end
  
  describe '#create_user' do
    it 'creates a user object' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"test5@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user_info = UserFacade.create_user(user_data)

        user = UserFacade.get_user(user_info.id)
        expect(user).to be_a(User)

        UserService.delete_user(user.id)
    end
  end
end