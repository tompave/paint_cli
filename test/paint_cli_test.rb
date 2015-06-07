require 'minitest_helper'

class PaintCliTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PaintCli::VERSION
  end


  def test_responds_to_run
    assert_respond_to PaintCli, :run
  end

end
