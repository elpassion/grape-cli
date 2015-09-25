require 'grape/application_factory'

class GrapeCli < Thor
  include Thor::Actions

  desc 'console', 'Start the Grape console, alias "c"'

  def console
    puts 'Starting Grape console...'

    run(ApplicationFactory.instance.command_generator.run_console, verbose: false)
  end

  map 'c' => 'console'
end
