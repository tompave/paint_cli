# PaintCli::Operation::Base is an abstract class, not meant to
# be instantiated directly.
# This basic implementation is meant to define the behaviour
# for the concrete subclasses.
#
module PaintCli::Operation
  class Base

    attr_reader :args

    def initialize(args_array=nil)
      @args = args_array
    end

    # return an output bitmap
    #
    def process(input_bmp)
      input_bmp
    end
  end
end
