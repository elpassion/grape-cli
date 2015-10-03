require 'delegate'

module GrapeCli
  module Actions
    class CreateApplication < SimpleDelegator
      def run(config, destination_path)
        source_path = File.join(config[:source_root], 'templates', 'application')

        directory(source_path, destination_path, config)
      end
    end
  end
end
