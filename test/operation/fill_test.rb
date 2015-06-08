require 'minitest_helper'

class FillTest < Minitest::Test

  def setup
    super
  end


  def test_fill_framed_area
    bmp = bitmap_with_frame
    operation = PaintCli::Operation::Fill.new([5, 7, "C"])

    out = operation.process(bmp)
    expected = <<-EOS
OOOOOOOOOOOO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOCCCCCCCCCO
OOOOOOOOOOOO
    EOS

    assert_equal expected.strip, out.render
  end


  def test_fill_line
    bmp = bitmap_with_frame
    operation = PaintCli::Operation::Fill.new([3, 5, "S"])

    out = operation.process(bmp)
    expected = <<-EOS
OOOOOOOOOOOO
OOSSSSSSSSSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSOOOOOOOSO
OOSSSSSSSSSO
OOOOOOOOOOOO
    EOS

    assert_equal expected.strip, out.render
  end


  def test_fill_open_area
    bmp = bitmap_with_open_frame
    operation = PaintCli::Operation::Fill.new([5, 7, "S"])

    out = operation.process(bmp)
    expected = <<-EOS
SSSSSSSSSSSS
SSCCCCCCCCCS
SSCSSSSSSSCS
SSCSSSSSSSCS
SSCSSSSSSSCS
SSCSSSSSSSSS
SSCSSSSSSSCS
SSCSSSSSSSCS
SSCSSSSSSSCS
SSCSSSSSSSCS
SSCCCCCCCCCS
SSSSSSSSSSSS
    EOS

    assert_equal expected.strip, out.render
  end



  private

  def bitmap_with_frame
    bmp = PaintCli::Bitmap.new(12, 12)
    bmp = PaintCli::Operation::HorizontalLine.new([3, 11, 2, "C"]).process(bmp)
    bmp = PaintCli::Operation::HorizontalLine.new([3, 11, 11, "C"]).process(bmp)

    bmp = PaintCli::Operation::VerticalLine.new([3, 2, 11, "C"]).process(bmp)
    bmp = PaintCli::Operation::VerticalLine.new([11, 2, 11, "C"]).process(bmp)

    check = <<-EOS
OOOOOOOOOOOO
OOCCCCCCCCCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCCCCCCCCCO
OOOOOOOOOOOO
    EOS

    assert_equal check.strip, bmp.render

    bmp
  end


  def bitmap_with_open_frame
    bmp = PaintCli::Bitmap.new(12, 12)
    bmp = PaintCli::Operation::HorizontalLine.new([3, 11, 2, "C"]).process(bmp)
    bmp = PaintCli::Operation::HorizontalLine.new([3, 11, 11, "C"]).process(bmp)

    bmp = PaintCli::Operation::VerticalLine.new([3, 2, 11, "C"]).process(bmp)
    bmp = PaintCli::Operation::VerticalLine.new([11, 2, 5, "C"]).process(bmp)
    bmp = PaintCli::Operation::VerticalLine.new([11, 7, 11, "C"]).process(bmp)

    check = <<-EOS
OOOOOOOOOOOO
OOCCCCCCCCCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOOO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCOOOOOOOCO
OOCCCCCCCCCO
OOOOOOOOOOOO
    EOS

    assert_equal check.strip, bmp.render

    bmp
  end

end
