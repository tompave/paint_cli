module PaintCli
  class Repl

    def start
      enter_loop
    end


    private

    def parser
      @parser ||= Parser.new
    end


    def enter_loop
      loop do
        cmd = next_command
        if cmd == "X"
          break
        else
          parser.parse cmd
        end
      end
    end


    def next_command
      gets.chomp
    end

  end
end
