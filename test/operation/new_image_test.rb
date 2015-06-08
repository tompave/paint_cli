require 'minitest_helper'

class NewImageTest < Minitest::Test

  def setup
    super
    @args = [7, 5]
    @operation = PaintCli::Operation::NewImage.new(@args)
  end


  def test_process_returns_a_bitmap_with_any_arg
    assert_instance_of PaintCli::Bitmap, @operation.process
    assert_instance_of PaintCli::Bitmap, @operation.process(nil)
    assert_instance_of PaintCli::Bitmap, @operation.process(PaintCli::Bitmap.new(1,1))
  end


  def test_new_bitmap_has_right_size
    bmp = @operation.process
    assert_equal 7, bmp.width
    assert_equal 5, bmp.height
  end


  def test_new_bitmap_is_blank
    expected = PaintCli::Bitmap.new(7, 5)
    assert_equal expected.render, @operation.process.render
  end


  def test_invalid_arguments
    @op = PaintCli::Operation::NewImage.new([251, 100])
    error_msg = "The requested size is invalid. Width and Height should be between 1 and 250\n"
    out = false

    assert_output error_msg do
      out = @op.process
    end

    assert_nil out
  end

end
