require 'minitest_helper'

class ClearTest < Minitest::Test

  def setup
    super
    @bmp = PaintCli::Bitmap.new(4, 4)
    @operation = PaintCli::Operation::Clear.new
  end


  def test_process_returns_a_blank_image
    assert_instance_of PaintCli::Bitmap, @operation.process(@bmp)    
  end


  def test_new_bitmap_has_right_size
    out = @operation.process(@bmp)
    assert_equal 4, out.width
    assert_equal 4, out.height
  end


  def test_new_bitmap_is_blank
    out = @operation.process(@bmp)

    assert_equal out.render, PaintCli::Bitmap.new(4, 4).render
  end

end
