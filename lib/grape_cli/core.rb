require 'grape_cli/application_factory'
require 'grape_cli/config'
require 'grape_cli/actions/create_application'
require 'grape_cli/actions/setup_database'
require 'grape_cli/actions/setup_test_framework'

module GrapeCli
  class Core < Thor
    include Thor::Actions

    desc 'new APP_NAME', 'Create a new Grape application'

    method_option :work_dir, default: Dir.pwd
    method_option :database, aliases: 'd', default: 'sqlite', enum: %w(postgres sqlite)
    method_option :test,     aliases: 't', default: 'rspec', enum: %w(minitest rspec)

    def self.source_root
      File.dirname(__FILE__)
    end

    # rubocop:disable Metrics/AbcSize
    def new(app_name)
      config           = GrapeCli::Config.new(app_name, GrapeCli::Core.source_root, options).config
      application_path = File.join(options[:work_dir], app_name)

      GrapeCli::Actions::CreateApplication.new(self).run(config, application_path)
      GrapeCli::Actions::SetupDatabase.new(self).run(config)
      GrapeCli::Actions::SetupTestFramework.new(args, options, config).run

      inside application_path do
        run(ApplicationFactory.instance.command_generator.bundle_install, config)
      end
    end

    desc 'server', 'Start the Grape server, alias "s"'
    map 's' => 'server'

    def server(args = nil)
      puts 'Starting Grape server...'

      run(ApplicationFactory.new.command_generator.run_server(args), verbose: false)
    end

    desc 'console', 'Start the Grape console, alias "c"'
    map 'c' => 'console'

    def console
      puts 'Starting Grape console...'

      run(ApplicationFactory.instance.command_generator.run_console, verbose: false)
    end

    desc 'test', 'Start tests'

    def test
      run(ApplicationFactory.instance.command_generator.run_tests, verbose: false)
    end
  end
end
