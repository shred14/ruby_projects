class MenuItem
  attr_writer :text

  def initialize(name, &action)
    @name = name
    @action = action
  end

  def to_s
    return name.to_s if @text.nil?
    @text
  end

  def display
    puts text
  end
end