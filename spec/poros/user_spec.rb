require 'rails_helper'

RSpec.describe User do
  it "exists and has readable attributes" do
    user_json = JSON.parse(File.read('./spec/fixtures/user.json'), symbolize_names: true)
    
    user = User.new(user_json[:data])

    expect(user).to be_a User 
    expect(user.first_name).to eq("Jennifer")
    expect(user.last_name).to eq("Halloran")
    expect(user.email).to eq("jenniferhalloran@gmail.com")
    expect(user.id).to eq(1)
  end
  
end