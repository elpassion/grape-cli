class GrapeCli < Thor
  include Thor::Actions

  argument :app_name
  desc "new PROJECT_NAME", "some desc to avoid warning"

  class_option :work_dir, default: Dir.pwd

  def self.source_root
    File.dirname(__FILE__)
  end

  def new
    Dir.glob(File.join(GrapeCli.source_root, 'template/**/*')) do |file|
      next if File.directory?(file)
      path = file.split('/')
      relative_path = path[path.index('application')+1..-1].join('/')

      copy_file(file, File.join(options[:work_dir], app_name, relative_path))
    end
  end
end
