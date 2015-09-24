require 'test_helper'
require 'tmpdir'

class Grape::CreateTest < Minitest::Test
  def setup
    @folder = Dir.mktmpdir
    @app_name = 'Koszcz'
    @app_folder = File.join(@folder, @app_name)
    ProjectGenerator.new([@folder, @app_name]).invoke(:generate)
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
end

class ProjectGenerator < Thor
  include Thor::Actions

  class_option :app_name, default: 'my_app'

  desc "new PROJECT_NAME", "some desc to avoid warning"

  def self.source_root
    File.dirname(__FILE__)
  end

  def generate(folder, app_name)
    Dir.mkdir(File.join(folder, app_name))
    FileUtils.touch(File.join(folder, app_name, 'Gemfile'))
  end
end