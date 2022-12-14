require 'rails_helper'

RSpec.describe SessionFacade do 
  describe '#create_session' do
    it 'authenticates and returns user object' do
      user_data = {"first_name"=>"Test",
                  "last_name"=>"User", 
                  "email"=>"test1@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

        login_data = {"email"=>"test1@gmail.com", 
                      "password"=>"iheartcats"}
                      
        session = SessionFacade.create_session(login_data)

        expect(session).to be_a(User)

        UserService.delete_user(user.id)
    end

    it 'returns an error if the login information is not correct' do
      user_data = {"first_name"=>"Jenn",
                  "last_name"=>"Halloran", 
                  "email"=>"test2@gmail.com", 
                  "password"=>"iheartcats", 
                  "password_confirmation"=>"iheartcats"}

        user = UserFacade.create_user(user_data)

        login_data = {"email"=>"test2@gmail.com", 
                      "password"=>"ihatecats"}
                      
        session = SessionFacade.create_session(login_data)

        expect(session).to be_a(Error)

        UserService.delete_user(user.id)
    end
  end
end