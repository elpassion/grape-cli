class GrapeCli < Thor
  include Thor::Actions

  argument :app_name
  desc "new PROJECT_NAME", "some desc to avoid warning"

  class_option :work_dir, default: Dir.pwd

  def self.source_root
    File.dirname(__FILE__)
  end

  def new
    Dir.glob(File.join(GrapeCli.source_root, 'template/application/**/*'), File::FNM_DOTMATCH).each do |file|
      next if File.directory?(file)
      path = file.split('/')
      if File.extname(file) == '.erb'
        template(file, (File.join(options[:work_dir], app_name, path[path.index('application')+1..-1].join('/').chomp('.erb'))))
      else
        copy_file(file, (File.join(options[:work_dir], app_name, path[path.index('application')+1..-1].join('/'))), force: true)
      end
    end
  end
end
