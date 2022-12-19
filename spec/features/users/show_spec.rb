require 'rails_helper'

RSpec.describe 'user dashboard(show)' do 
  before do
    visit '/dashboard'
  end

  it "displays the header" do
    expect(page).to have_content("Gather Studio")
  end
  
end