require 'rails_helper'

RSpec.describe Item do
  describe '#get_user_items(id)' do
    it 'exists and has readable attributes' do 
        item_json = JSON.parse(File.read('./spec/fixtures/item.json'), symbolize_names: true)
    
    item = Item.new(item_json)

    expect(item).to be_an Item 
    expect(item.name).to eq("Spoon")
    expect(item.style).to eq("Hand Built")
    expect(item.status).to eq("Built")
    expect(item.clay_body).to eq("Red Clay")
    end
  end
end