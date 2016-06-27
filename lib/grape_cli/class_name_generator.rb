class ClassNameGenerator
  def initialize(app_name)
    @app_name = app_name
  end

  def generate
    @app_name.split(/\-|\_/).collect(&:capitalize).join
  end
end
