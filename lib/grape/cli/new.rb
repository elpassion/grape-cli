class GrapeCLI < Thor
  desc "new", "Create new grape app"

  def new(app_name)
    puts "#{app_name}"
  end
end

class ProjectGenerator < Thor
  include Thor::Actions

  desc "new PROJECT_NAME", "some desc to avoid warning"

  def self.source_root
    File.dirname(__FILE__)
  end

  def generate(folder, app_name)
    directory('template', File.join(folder, app_name))
  end
end