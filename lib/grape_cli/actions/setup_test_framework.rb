module GrapeCli
  module Actions
    class SetupTestFramework
      include Thor::Base
      include Thor::Actions

      attr_reader :options, :config

      def self.source_root
        File.dirname(__FILE__)
      end

      def initialize(args = [], local_options = {}, config = {})
        super
        @options = local_options
        @config  = config
      end

      def run
        source_path      = File.join(config[:source_root], 'templates', options[:test])
        destination_path = File.join(options[:work_dir], config[:app_name], test_directory_name)

        directory(source_path, destination_path, config)

        copy_rspec_config if options[:test] == 'rspec'
      end

      private

      def test_directory_name
        {
          minitest: 'test',
          rspec:    'spec'
        }[options[:test].to_sym]
      end

      def copy_rspec_config
        source_path      = File.join(config[:source_root], 'templates', 'rspec_config')
        destination_path = File.join(options[:work_dir], config[:app_name], '.rspec')

        template(source_path, destination_path, config)
      end
    end
  end
end
