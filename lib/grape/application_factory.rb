require 'grape/command_generator'

class ApplicationFactory
  @@instance = ApplicationFactory.new

  def self.instance
    @@instance
  end

  def self.instance=(instance)
    @@instance = instance
  end

  def command_generator
    CommandGenerator.new
  end

  def verbose_output
    true
  end
end
