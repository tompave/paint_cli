require 'minitest_helper'

class ParserTest < Minitest::Test

  def setup
    super
    @parser = PaintCli::Parser.new
  end


  def test_it_respond_to_parse
    assert_respond_to @parser, :parse
  end


  # new image
  # I M N
  #
  def test_command_I
    cmd = "I 17 19"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::NewImage, operation
    assert_equal [17, 19], operation.args
  end


  # clear the table
  # C
  #
  def test_command_C
    cmd = "C"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::Clear, operation
    assert_nil operation.args
  end

  # color a single pixel
  # L X Y C
  #
  def test_command_L
    cmd = "L 2 3 C"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::ColorPixel, operation
    assert_equal [2, 3, "C"], operation.args
  end


  # draw a vertical line
  # V X Y1 Y2 C
  #
  def test_command_V
    cmd = "V 3 2 8 C"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::VerticalLine, operation
    assert_equal [3, 2, 8, "C"], operation.args
  end


  # draw a vertical line
  # H X1 X2 Y C
  #
  def test_command_H
    cmd = "H 3 5 11 C"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::HorizontalLine, operation
    assert_equal [3, 5, 11, "C"], operation.args
  end


  # fill an area
  # F X Y C
  #
  def test_command_F
    cmd = "F 4 5 C"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::Fill, operation
    assert_equal [4, 5, "C"], operation.args
  end


  # show the image
  # S
  #
  def test_command_S
    cmd = "S"
    operation = @parser.parse(cmd)
    assert_instance_of PaintCli::Operation::Show, operation
    assert_nil operation.args
  end
end
