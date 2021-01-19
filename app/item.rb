class Item
  attr_accessor :name, :price
  @@all = []
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end



  def self.find_by_name(item_name)
    @@all.select{|item| item.name == item_name}[0]
  end
end
