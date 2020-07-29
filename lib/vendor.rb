class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.reduce(0) do |accum, inv_pairs|
      accum += inv_pairs[1] * inv_pairs[0].price
      accum
    end
  end
end
