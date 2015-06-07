require 'minitest_helper'

class ParserTest < Minitest::Test

  def setup
    super
    @parser = PaintCli::Parser.new
  end


  def test_it_respond_to_parse
    assert_respond_to @parser, :parse
  end
end
