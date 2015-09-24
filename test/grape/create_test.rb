require 'test_helper'
require 'tmpdir'

class Grape::CreateTest < Minitest::Test
  def setup
    @folder = Dir.mktmpdir
    @app_name = 'Koszcz'
    @app_folder = File.join(@folder, @app_name)
    ProjectGenerator.new(@folder, @app_name).generate
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

class ProjectGenerator
  def initialize(folder, app_name)
    @folder, @app_name = folder, app_name
    @app_folder = File.join(@folder, @app_name)    
  end

  def generate
    Dir.mkdir(@app_folder)
    FileUtils.touch(File.join(@app_folder, 'Gemfile'))
  end
end