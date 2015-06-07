module PaintCli
  module Operation
  end
end

require "paint_cli/operation/base"

require "paint_cli/operation/new_image"
require "paint_cli/operation/clear"
require "paint_cli/operation/color_pixel"
require "paint_cli/operation/vertical_line"
require "paint_cli/operation/horizontal_line"
require "paint_cli/operation/fill"
require "paint_cli/operation/show"
