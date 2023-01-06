class Item 
  attr_reader :name, :status, :style, :clay_body, :glazes, :height, :width, :memo 

  def initialize(data)
    @name = data[:attributes][:name]
    @style = data[:attributes][:style]
    @status = data[:attributes][:status]
    @clay_body = data[:attributes][:clay_body]
    @height = data[:attributes][:height].to_f
    @width = data[:attributes][:width].to_f
    @memo = data[:attributes][:memo]
  end
end