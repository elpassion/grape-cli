require 'test_helper'
require 'grape_cli/class_name_generator'

class GrapeCli::ClassNameGeneratorTest < Minitest::Test
  def test_generate_proper_names
    assert ClassNameGenerator.new("hello").generate == "Hello"
    assert ClassNameGenerator.new("hello_long_name").generate == "HelloLongName"
  end
end
