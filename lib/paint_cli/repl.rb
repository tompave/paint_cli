module PaintCli
  class Repl

    def start
      @bitmap = nil
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
          run_command(cmd)
        end
      end
    end


    def next_command
      gets.chomp
    end


    def run_command(cmd)
      operation = parser.parse(cmd)
      @bitmap = operation.process(@bitmap)
    rescue PaintCli::BaseError => e
      puts e.message
    end

  end
end
