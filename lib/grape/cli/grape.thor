class Grape < Thor
  desc "new", "Create new grape app"

  def new(app_name)
    puts "#{app_name}"
  end
end
