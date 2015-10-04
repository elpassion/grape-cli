require 'delegate'

module GrapeCli
  module Actions
    class SetupDatabase < SimpleDelegator
      def run(config)
        source_path      = File.join(config[:source_root], 'templates', 'database', "#{options[:database]}.yml.tt")
        destination_path = File.join(options[:work_dir], config[:app_name], 'config', 'database.yml')

        template(source_path, destination_path, config)
      end
    end
  end
end
