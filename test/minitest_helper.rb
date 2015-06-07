$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'paint_cli'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new


module IoTestHelpers
  # To simulate a sequence of commands issued to STDIN,
  # used to test REPL input.
  #
  def simulate_repl_input(commands, &block)
    io = StringIO.new
    commands.each { |cmd| io.puts(cmd) }
    io.rewind

    actual_stdin = $stdin
    $stdin = io

    yield
  ensure
    $stdin = actual_stdin
  end
end
