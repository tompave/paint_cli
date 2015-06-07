module PaintCli::Operation
  class NewImage < Base
    SIZE_ERROR_MSG = "The requested size is invalid. Width and Height should be between 1 and 250"

    def initialize(args_array=nil)
      @args = args_array
      @w, @h = args
    end


    def process(input_bmp=nil)
      PaintCli::Bitmap.new(@w, @h)
    rescue PaintCli::Bitmap::SizeError
      puts SIZE_ERROR_MSG
    end
  end
end
