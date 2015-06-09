require "paint_cli/version"
require "paint_cli/base_error"
require "paint_cli/bitmap"
require "paint_cli/parser"
require "paint_cli/repl"
require "paint_cli/operation"

module PaintCli
  class << self
    def run
      repl = Repl.new
      repl.start
    end
  end
end
