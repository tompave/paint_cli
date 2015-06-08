module PaintCli::Operation
  class VerticalLine < Base

    def initialize(args_array)
      @args = args_array
      @x, @y1, @y2, @color = line_coords
    end


    def process(input)
      bmp = input

      (@y1..@y2).each do |y|
        bmp.change_pixel(@x, y, @color)
      end

      bmp
    end

    private

    def line_coords
      args[0..3]
    end

  end
end
