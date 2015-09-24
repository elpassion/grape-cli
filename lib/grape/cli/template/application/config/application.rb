$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../../app/models/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../app/resources/*.rb', __FILE__)].each { |file| require file }

require 'api'
