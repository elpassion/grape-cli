require 'grape_cli/class_name_generator'
require 'grape_cli/application_factory'

module GrapeCli
  class Config
    attr_reader :app_name, :options, :source_root

    def initialize(app_name, source_root, options = {})
      @app_name    = app_name
      @options     = options
      @source_root = source_root
    end

    def config
      {
        source_root:  source_root,
        app_name:     app_name,
        class_name:   ClassNameGenerator.new(app_name).generate,
        database:     options[:database],
        database_gem: database_gem,
        rspec:        rspec?,
        verbose:      ApplicationFactory.instance.verbose_output
      }
    end

    private

    def rspec?
      options[:test] == 'rspec'
    end

    def database_gem
      {
        postgres: 'pg',
        sqlite:   'sqlite3'
      }[options[:database].to_sym]
    end
  end
end
