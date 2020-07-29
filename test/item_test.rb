require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new({name: 'Peach', price: "$0.75"})
  end

  def test_it_exists

  end
end
