module PaintCli::Operation
  class ColorPixel < Base
    def initialize(args_array=nil)
      @args = args_array
      @x, @y, @color = args
    end


    def process(input_bmp)
      bmp = input_bmp
      bmp.change_pixel(@x, @y, @color)
      bmp
    end
  end
end
