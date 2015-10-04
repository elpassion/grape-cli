class TestFactory < ApplicationFactory
  def command_generator
    FakeGenerator.new
  end

  def verbose_output
    false
  end
end
