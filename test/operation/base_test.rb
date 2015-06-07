require 'minitest_helper'

class OperationBaseTest < Minitest::Test

  def setup
    super
    @arguments = [1, 2, 3]
    @operation = PaintCli::Operation::Base.new(@arguments)
  end


  def test_args
    assert_respond_to @operation, :args
  end


  def test_process
    assert_respond_to @operation, :process
  end
end
