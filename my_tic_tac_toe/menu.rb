class Menu
  attr_accessor :prompt

  def intialize
    @items = []
    @prompt = "User Input"
  end

  def choice(name, text = nil, &action)
    item = MenuItem.new(name, &action)
    @item.text = text.nil? ? name.to_s : text_description
  end

  def to_s
    @prompt << "\n" << @items.join("\n")
  end
end