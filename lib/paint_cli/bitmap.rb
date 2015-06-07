module PaintCli
  class Bitmap
    ALLOWED_SIZE = 1..250

    attr_reader :width, :height


    def initialize(width, height)
      @width, @height = width, height
      validate!
    end

    private

    def validate!
      if !((ALLOWED_SIZE === width) && (ALLOWED_SIZE === height))
        raise SizeError, "dimensions w: #{width} and h: #{height} are out of range (1..250)"
      end
    end


    class SizeError < ::StandardError
    end

  end
end
