require 'pry'
require 'test_helper'
require 'tmpdir'
require './lib/grape/cli'
require './lib/grape/cli/application_factory'

class Grape::CreateTest < Minitest::Test
  def setup
    @folder = Dir.mktmpdir
    @app_name = 'Koszcz'
    @app_folder = File.join(@folder, @app_name)
    ApplicationFactory.instance = TestFactory.new
    GrapeCli.new([@app_name], {work_dir: @folder}).invoke(:new)
  end

  def teardown
    FileUtils.rm_rf(@folder)
  end

  def test_creates_a_root_folder
    assert Dir.exists?(@app_folder)
  end

  def test_creates_a_gemfile
    assert File.exists?(File.join(@app_folder, 'Gemfile'))
  end

  def test_creates_an_application_folder
    assert File.exists?(File.join(@app_folder, 'app'))
    assert File.directory?(File.join(@app_folder, 'app'))
  end

end

class FakeGenerator < CommandGenerator
  def bundle_install; ''; end
end

class TestFactory < ApplicationFactory
  def command_generator
    FakeGenerator.new
  end
end