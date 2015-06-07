require 'minitest_helper'

class PaintCliTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PaintCli::VERSION
  end

end
