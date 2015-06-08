module PaintCli
  class Bitmap
    ALLOWED_SIZE = 1..250
    DEFAULT_COLOR = "O"

    attr_reader :width, :height


    def initialize(width, height)
      @width, @height = width, height
      validate!
      @matrix = build_matrix
    end


    def render
      matrix.transpose.map do |row|
        row.join
      end.join("\n")
    end


    def change_pixel(x, y, color)
      x_coord, y_coord = sanitize(x, y)
      matrix[x_coord][y_coord] = color
    end


    def color_for_pixel(x, y)
      x_coord, y_coord = sanitize(x, y)
      matrix[x_coord][y_coord]
    end


    private

    attr_reader :matrix


    def validate!
      if !((ALLOWED_SIZE === width) && (ALLOWED_SIZE === height))
        raise SizeError, "dimensions w: #{width} and h: #{height} are out of range (1..250)"
      end
    end


    def build_matrix
      Array.new(width) do
        Array.new(height) do
          DEFAULT_COLOR
        end
      end
    end


    def sanitize(x, y)
      if !(((1..width) === x) && ((1..height) === y))
        raise CoordinateError, "coordinates x: #{x} and y: #{y} are out of frame (#{width}x#{height})"
      end
      [x - 1, y - 1]
    end


    class SizeError < ::StandardError
    end

    class CoordinateError < ::StandardError
    end

  end
end
