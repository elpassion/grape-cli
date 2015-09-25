require 'grape/application_factory'
require 'grape/class_name_generator'

class GrapeCli < Thor
  include Thor::Actions

  desc "new APP_NAME", "Create a new Grape application"

  method_option :work_dir, default: Dir.pwd
  method_option :database, aliases: 'd', default: 'postgres'

  def self.source_root
    File.dirname(__FILE__)
  end

  def new(app_name)
    template_path = File.join(GrapeCli.source_root, 'template')
    application_template_path = File.join(template_path, 'application')
    destination_path = File.join(options[:work_dir], app_name)
    config = create_config(app_name)

    directory(application_template_path, destination_path, config)
    template(File.join(template_path, 'database', "#{options[:database]}.yml.tt"),
             File.join(destination_path, 'config', 'database.yml'))
    inside destination_path do
      run(ApplicationFactory.instance.command_generator.bundle_install, config)
    end
  end

  private

  def create_config(app_name)
    {
      app_name: app_name,
      class_name: ClassNameGenerator.new(app_name).generate,
      database: options[:database],
      database_gem: database_gem(options[:database]),
      verbose: ApplicationFactory.instance.verbose_output
    }
  end


  def database_gem(database)
    {
        postgres: 'pg',
        sqlite: 'sqlite3'
    }[database.to_sym]
  end
end
