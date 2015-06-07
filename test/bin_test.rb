require 'minitest_helper'

class BinTest < Minitest::Test
  include IoTestHelpers

  # if the test can't find the bin, we want it to fail here
  #
  def test_bin_is_available
    assert File.exist?(bin_file)
  end


  def test_repl_example_1
    expected = <<-EOS
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
    EOS
    commands = [
      "I 5 6",
      "L 2 3 A",
      "S"
    ]

    assert_match /#{expected}/, output_for_commands(commands)
  end



  def test_repl_example_2
    expected = <<-EOS
JJJJJ
JJZZJ
JWJJJ
JWJJJ
JJJJJ
JJJJJ
    EOS
    commands = [
      "I 5 6",
      "L 2 3 A",
      "F 3 3 J",
      "V 2 3 4 W",
      "H 3 4 2 Z",
      "S"
    ]

    assert_match /#{expected}/, output_for_commands(commands)
  end



  private

  def bin_file
    File.expand_path("../../bin/paint_cli", __FILE__)
  end


  def output_for_commands(commands)
    out, err = capture_subprocess_io do
      simulate_repl_input(commands) do
        system(bin_file)
      end
    end
    out
  end

end
