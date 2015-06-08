module PaintCli::Operation
  class HorizontalLine < Base

    def initialize(args_array)
      @args = args_array
      @x1, @x2, @y, @color = line_coords
    end


    def process(input)
      bmp = input

      (@x1..@x2).each do |x|
        bmp.change_pixel(x, @y, @color)
      end

      bmp
    end

    private

    def line_coords
      args[0..3]
    end
  end
end
