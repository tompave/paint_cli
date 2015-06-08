require 'minitest_helper'

class ShowTest < Minitest::Test

  def setup
    super
    @bmp = PaintCli::Bitmap.new(5, 7)
    @operation = PaintCli::Operation::Show.new(nil)
  end


  def test_process_returns_the_same_bitmap
    assert_equal @bmp, @operation.process(@bmp)
  end


  def test_it_prints_the_bitmap
    assert_output "#{@bmp.render}\n" do
      @operation.process(@bmp)
    end
  end

end
