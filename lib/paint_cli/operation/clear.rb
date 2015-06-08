module PaintCli::Operation
  class Clear < Base

    def process(input)
      PaintCli::Bitmap.new(input.width, input.height)
    end
  end
end
