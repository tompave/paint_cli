require 'minitest_helper'

class OperationBaseTest < Minitest::Test

  def setup
    super
    @input = PaintCli::Bitmap.new(5, 3)
    @arguments = [1, 2, 3]
    @operation = PaintCli::Operation::Base.new(@input, @arguments)
  end


  def test_args
    assert_respond_to @operation, :args
  end


  def test_execute
    assert_respond_to @operation, :execute
  end
end
