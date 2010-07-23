module Zync
  module Generator

    class App < Thor
      include Thor::Actions

      def self.source_root
        File.expand_path(File.dirname(__FILE__))
      end

      desc "build APP_NAME", "Builds the framework"
      def build(name)
        directory "templates/application", name
      end
    end

  end
end