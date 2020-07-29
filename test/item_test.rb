require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Item, @item
  end

  def test_it_has_readable_attributes
    assert_equal 'Tomato', @item.name
    assert_equal 0.5, @item.price
  end
end
