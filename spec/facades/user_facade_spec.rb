require 'rails_helper'

RSpec.describe UserFacade do 
  describe '#create_user' do
    xit 'creates a user object' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"halloran@udel.edu", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

        expect(user).to be_a(User)
    end
  end
end