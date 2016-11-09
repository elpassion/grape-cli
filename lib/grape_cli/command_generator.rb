class CommandGenerator
  def bundle_install
    'bundle install'
  end

  def run_server(args)
    "rackup #{args}"
  end

  def run_console
    'racksh'
  end

  def run_tests
    'bundle exec rake'
  end
end
