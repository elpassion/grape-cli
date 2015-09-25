require 'grape/application_factory'

class GrapeCli < Thor
  include Thor::Actions

  desc "server", 'Start the Grape server, alias "s"'

  def server
    puts 'Starting Grape server...'

    run(ApplicationFactory.instance.command_generator.run_server, verbose: false)
  end
end
