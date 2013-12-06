class ExecutableException < Exception
  attr_accessor :executable
  def initialize(block)
    @executable=block
  end
end