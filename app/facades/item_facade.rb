class ItemFacade 
  # def self.create_item(data, user_id)

  # end

  def self.get_user_items(id, status="none")
    json = ItemService.get_user_items(id, status)
    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

end