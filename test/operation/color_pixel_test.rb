require 'minitest_helper'

class ColorPixelTest < Minitest::Test

  def setup
    super
    @bmp = PaintCli::Bitmap.new(5, 4)
    @args = [2, 3, "C"]
    @operation = PaintCli::Operation::ColorPixel.new(@args)
    @out = @operation.process(@bmp)
  end


  def test_process_returns_a_different_bitmap
    refute_equal @bmp.render, @out.render
  end


  def test_process_returns_a_bitmap_of_the_same_size
    assert_equal @bmp.width, @out.width
    assert_equal @bmp.height, @out.height
  end


  def test_output_has_been_colored
    expected = <<-EOS
OOOOO
OOOOO
OCOOO
OOOOO
    EOS

    assert_equal expected, @out.render
  end
end
