class CommandGenerator
  def bundle_install
    'bundle install'
  end

  def run_server
    'rackup'
  end

  def run_console
    'racksh'
  end
end
