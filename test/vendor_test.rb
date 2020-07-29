require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_readable_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    expected = {}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock
    item1 = Item.new({name: 'Tomato', price: '$0.50'})
    assert_equal 0, @vendor.check_stock(item1)

    expected = {}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_stock_items
    item1 = Item.new({name: 'Tomato', price: '$0.50'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor.stock(item1, 30)

    expected = {item1 => 30}

    assert_equal expected, @vendor.inventory
    assert_equal 30, @vendor.check_stock(item1)

    @vendor.stock(item1, 25)
    assert_equal 55, @vendor.check_stock(item1)

    @vendor.stock(item2, 12)

    expected = {item1 => 55, item2 => 12}
    assert_equal expected, @vendor.inventory
  end
end
