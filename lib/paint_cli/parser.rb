module PaintCli
  class Parser

    def parse(cmd_string)
      cmd, args = extract_data(cmd_string)
      find_operation(cmd).new(args)
    end


    private


    def extract_data(str)
      args = str.split
      cmd = args.shift
      [cmd, sanitize(args)]
    end


    def find_operation(cmd)
      case cmd
      when "I" then Operation::NewImage
      when "C" then Operation::Clear
      when "L" then Operation::ColorPixel
      when "V" then Operation::VerticalLine
      when "H" then Operation::HorizontalLine
      when "F" then Operation::Fill
      when "S" then Operation::Show
      else
        puts "Unrecognized command '#{cmd}'"
        Operation::Base
      end
    end


    DIGIT_REGEX = /\A\d{1,3}\z/

    def sanitize(list)
      if list.empty?
        nil
      else
        list.map do |i|
          (DIGIT_REGEX =~ i) ? i.to_i : i
        end
      end
    end

  end
end
