class GrapeCli < Thor
  include Thor::Actions

  argument :app_name
  desc "new", "Create a new Grape application"

  class_option :work_dir, default: Dir.pwd

  def self.source_root
    File.dirname(__FILE__)
  end

  def new
    application_template_path = File.join(GrapeCli.source_root, 'template/application')
    destination_path          = File.join(options[:work_dir], app_name)

    directory(application_template_path, destination_path)

    inside destination_path do
      run 'bundle install'
    end
  end
end
