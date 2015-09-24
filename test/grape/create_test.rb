require 'test_helper'
require 'tmpdir'

class Grape::CreateTest < Minitest::Test
  def setup
    @folder = Dir.mktmpdir
    @app_name = 'Koszcz'
  end

  def teardown
    FileUtils.rm_rf(@folder)
  end

  def test_creates_a_root_folder
    ProjectGenerator.new(@folder, @app_name).generate
    assert Dir.exists?(File.join(@folder, @app_name))
  end
end

class ProjectGenerator
  def initialize(folder, app_name)
    @folder, @app_name = folder, app_name
  end

  def generate
    Dir.mkdir(File.join(@folder, @app_name))
  end
end