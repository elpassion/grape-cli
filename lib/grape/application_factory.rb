require 'grape/command_generator'

class ApplicationFactory
  class << self;
    attr_accessor :instance
  end
  @@instance = ApplicationFactory.new

  def command_generator
    CommandGenerator.new
  end

  def verbose_output
    true
  end
end