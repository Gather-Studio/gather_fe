require 'rails_helper'

RSpec.describe 'Homepage' do
  it 'exists' do 
    visit '/'
    expect(current_path).to have_content("Gather Studio")
  end 
end