require 'minitest_helper'

class ReplTest < Minitest::Test
  include IoTestHelpers

  def setup
    super
    @parser_mock = Minitest::Mock.new
    @repl = PaintCli::Repl.new
  end


  def test_it_respond_to_start
    assert_respond_to @repl, :start
  end


  def test_it_parses_the_commands
    commands = %w(foo bar baz)
    commands.each do |cmd|
      @parser_mock.expect(:parse, PaintCli::Operation::Base.new, [cmd])
    end

    commands << "X"

    simulate_repl_input(commands) do
      with_mocked_parser do
        @repl.start
      end
    end
  end


  private


  def with_mocked_parser(&block)
    @repl.stub(:parser, @parser_mock, &block)
    @parser_mock.verify
  end

end
