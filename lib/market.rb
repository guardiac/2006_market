class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.find_all { |vendor| vendor.inventory.keys.include?(item) }
  end

  def total_inventory
    available_items.reduce do |result, item|
      result[item] = {quantity: item.}
      result
    end
  end

  def available_items
    @vendors.flat_map { |vendor| vendor.inventory.keys }.uniq
  end

  def available_item_quantities

  end
end
