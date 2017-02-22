require 'minitest/autorun'
require 'chilexpress_rails'

# This test will prove if chilexpress website response is what we need
class ChilexpressRailsTest < Minitest::Test
  def test_english_hello
    assert_equal String,
                 ChilexpressRails.search_order('99603009170').status.class
  end
end
