module PaintCli::Operation
  class Show < Base

    def process(input_bmp)
      puts input_bmp.render
      input_bmp
    end
  end
end
