require 'minitest_helper'

class BitmapTest < Minitest::Test

  def setup
    super
    @bmp = PaintCli::Bitmap.new(10, 7)
  end


  def test_initialize
    assert_instance_of PaintCli::Bitmap, @bmp
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


  def test_dimensions_are_saved
    bmp = PaintCli::Bitmap.new(200, 250)
    assert_equal 200, bmp.width
    assert_equal 250, bmp.height
  end


  def test_it_renders
    assert_respond_to @bmp, :render
    assert_instance_of String, @bmp.render
  end


  def test_a_new_bitmap_is_completely_white
    white_line = "O" * 10
    white_grid = 7.times.map { white_line }.join("\n")
    assert_equal white_grid, @bmp.render
  end


  def test_change_pixel
    assert_respond_to @bmp, :change_pixel
    
    @bmp = PaintCli::Bitmap.new(4, 4)
    old = @bmp.render
    @bmp.change_pixel(1, 1, "C")
    refute_equal @bmp.render, old

    expected = <<-EOS
COOO
OOOO
OOOO
OOOO
    EOS

    assert_equal expected.strip, @bmp.render
  end



  def test_change_pixel_coords_must_be_in_range
    @bmp = PaintCli::Bitmap.new(4, 4)
    @bmp.change_pixel(1, 1, "C")

    assert_raises(PaintCli::Bitmap::CoordinateError) do
      @bmp.change_pixel(1, 5, "C")
    end

    assert_raises(PaintCli::Bitmap::CoordinateError) do
      @bmp.change_pixel(0, 2, "C")
    end
  end


  def test_color_for_pixel
    @bmp = PaintCli::Bitmap.new(4, 4)
    @bmp.change_pixel(1, 1, "C")

    assert_equal "C", @bmp.color_for_pixel(1, 1)
    assert_equal "O", @bmp.color_for_pixel(2, 1)
  end


  def test_color_for_pixel_coords_must_be_in_range
    @bmp = PaintCli::Bitmap.new(4, 4)
    @bmp.color_for_pixel(1, 1)

    assert_raises(PaintCli::Bitmap::CoordinateError) do
      @bmp.color_for_pixel(1, 5)
    end

    assert_raises(PaintCli::Bitmap::CoordinateError) do
      @bmp.color_for_pixel(0, 2)
    end
  end



  def test_in_frame
    bmp = PaintCli::Bitmap.new(7, 7)

    assert bmp.in_frame? 2, 3
    assert bmp.in_frame? 1, 1
    assert bmp.in_frame? 7, 7

    refute bmp.in_frame? -1, 3
    refute bmp.in_frame? 7, 8
    refute bmp.in_frame? 11, 9
  end

end
