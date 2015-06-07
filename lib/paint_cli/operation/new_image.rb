module PaintCli::Operation
  class NewImage < Base

    def initialize(args_array=nil)
      @args = args_array
      @w, @h = args
    end


    def process(input_bmp=nil)
      PaintCli::Bitmap.new(@w, @h)
    end
  end
end
