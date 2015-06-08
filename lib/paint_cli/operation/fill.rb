module PaintCli::Operation
  class Fill < Base
    def initialize(args_array)
      @args = args_array
      @x, @y, @new_color = extract_args
    end


    def process(input)
      @bmp = input
      select_area.each do |pixel|
        @bmp.change_pixel(pixel.x, pixel.y, @new_color)
      end
      @bmp
    end



    private

    Pixel = Struct.new(:x, :y)


    def extract_args
      args[0..2]
    end


    def select_area
      @target_color = @bmp.color_for_pixel(@x, @y)

      first = Pixel.new(@x, @y)
      
      area = [first]
      checked = []
      candidates = [first]

      while (this = candidates.shift)
        if checked.include?(this)
          next
        else
          checked << this

          neighbours(this).each do |pxl|
            if matches?(pxl)
              area << pxl       unless area.include?(pxl)
              candidates << pxl unless candidates.include?(pxl)
            end
          end
        end
      end

      area
    end

    

    def neighbours(pixel)
      x, y = pixel.x, pixel.y
      xx = [x - 1, x + 1]
      yy = [y - 1, y + 1]
      # four = [x].product(yy) + [y].product(xx).map(&:reverse)
      four = [[x, yy[0]], [x, yy[1]], [xx[0], y], [xx[1], y]]

      four.select do |xy|
        @bmp.in_frame?(*xy)
      end.map do |xy|
        Pixel.new(*xy)
      end
    end


    def matches?(pixel)
      @bmp.color_for_pixel(pixel.x, pixel.y) == @target_color
    end

  end
end
