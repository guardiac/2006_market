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
    available_items.reduce(Hash.new { |h,k| h[k] = {} }) do |result, item|
      result[item] = {quantity: item_stock(item), vendors: vendors_that_sell(item)}
      result
    end
  end

  def available_items
    @vendors.flat_map { |vendor| vendor.inventory.keys }.uniq
  end

  def item_stock(item)
    @vendors.reduce(0) do |stock, vendor|
      stock += vendor.check_stock(item)
      stock
    end
  end

  def sorted_item_list
    available_items.map { |item| item.name }.sort
  end
end
