require 'rack/test'
require 'minitest/autorun'
require 'minitest/reporters'

ENV['RACK_ENV'] = 'test'

Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new, ENV)

require File.expand_path('../../config/environment', __FILE__)
