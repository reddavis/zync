module Zync
  class Logger

    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def warn(message)
      write_to_file(:warn, message)
    end

    def debug(message)
      write_to_file(:debug, message)
    end

    def info(message)
      write_to_file(:info, message)
    end

    def fatal(message)
      write_to_file(:fatal, message)
    end

    private

    def write_to_file(level, message)
      EM.system(
        'sh',
        Proc.new {|process| process.send_data("echo '#{level}: #{message}' >> #{file_path}\n"); process.send_data("exit\n") },
        Proc.new { }
      )
    end

  end
end
