require_relative 'pattern_matching_analizer'
require_relative '../../src/Exceptions/executable_exception'

module PatternMatching
  def pattern(item, &block)
    pma = PatternMatchingAnalizer.new()

    begin
      pma.analize(item, &block)
    rescue ExecutableException => exception
      self.instance_eval(&exception.executable)
    end
  end
end


class Object
  include PatternMatching
end