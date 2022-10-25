require 'rails_helper'

RSpec.describe 'Homepage' do
  before do 
    visit '/'
  end

  it 'has a header with links to classes and dashboard' do 
    expect(page).to have_content("Gather Studio")
    expect(page).to have_link("Classes")
    expect(page).to have_link("Open Studio")
  end 

  it 'displays homepage message' do
    expect(page).to have_content "Welcome to Gather Studio"
  end

  it 'displays contact information' do
    expect(page).to have_content "Contact"
    expect(page).to have_content "Address"
    expect(page).to have_content "Phone"
  end

  it "displays the studio hours" do
    expect(page).to have_content "Monday:"
    expect(page).to have_content "Closed"
  end
  
  it "displays the footer" do
    expect(page).to have_content "We would love to have you visit soon. No need to call ahead, just come on by!"
    expect(page).to have_content "Designed with by Jenn"
  end
  

  context "a user is not logged in" do
    it 'has a button to log in or sign up' do
      expect(page).to have_button "Register"
      expect(page).to have_button "Sign In"
    end
  end
  
end