require 'minitest_helper'

class ColorPixelTest < Minitest::Test

  def setup
    super
    @bmp = PaintCli::Bitmap.new(5, 4)
    @args = [2, 3, "C"]
    @operation = PaintCli::Operation::ColorPixel.new(@args)
  end


  def test_process_returns_a_different_bitmap
    old = @bmp.render
    out = @operation.process(@bmp)
    refute_equal old, out.render
  end


  def test_process_returns_a_bitmap_of_the_same_size
    out = @operation.process(@bmp)
    assert_equal @bmp.width, out.width
    assert_equal @bmp.height, out.height
  end


  def test_output_has_been_colored
    expected = <<-EOS
OOOOO
OOOOO
OCOOO
OOOOO
    EOS

    assert_equal expected.strip, @operation.process(@bmp).render
  end
end
