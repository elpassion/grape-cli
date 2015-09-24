require 'test_helper'
require 'tmpdir'
require './lib/grape/cli'

class Grape::CreateTest < Minitest::Test
  def setup
    @folder = Dir.mktmpdir
    @app_name = 'Koszcz'
    @app_folder = File.join(@folder, @app_name)
    GrapeCli.new([@app_name],{work_dir: @folder}).invoke(:new)
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

  def test_removes_erb_extension
    assert File.exists?(File.join(@app_folder, 'config.ru'))
  end

  def test_templates_erb_files
    assert File.foreach(File.join(@app_folder, 'config.ru')).grep(/#{@app_name}/).any?
  end
end
