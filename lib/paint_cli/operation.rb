# PaintCli::Operation is an abstract class, not meant to
# be instantiated directly.
# This basic implementation is meant to define the behaviour
# for the concrete subclasses.
#
module PaintCli
  class Operation

    attr_reader :args

    def initialize(bitmap, args_array=nil)
      @input_bmp = bitmap
      @args = args_array
    end

    # return an output bitmap
    #
    def execute
      input_bmp
    end


    private

    attr_reader :input_bmp
  end
end
