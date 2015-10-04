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

  def run_tests
    'bundle exec rake'
  end
end
