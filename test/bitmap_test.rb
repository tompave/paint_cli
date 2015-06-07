require 'minitest_helper'

class BitmapTest < Minitest::Test

  def test_initialize
    bmp = PaintCli::Bitmap.new(200, 250)
    assert_instance_of PaintCli::Bitmap, bmp
  end


  def test_dimesions_shouls_be_in_range
    assert_raises(PaintCli::Bitmap::SizeError) do
      PaintCli::Bitmap.new(251, 251)
    end

    assert_raises(PaintCli::Bitmap::SizeError) do
      PaintCli::Bitmap.new(251, 100)
    end

    assert_raises(PaintCli::Bitmap::SizeError) do
      PaintCli::Bitmap.new(100, 251)
    end
  end


  def assert_dimensions
    bmp = PaintCli::Bitmap.new(200, 250)
    assert_equal 200, bmp.width
    assert_equal 250, bmp.height
  end

end
