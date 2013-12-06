require_relative '../../src/Exceptions/executable_exception'
require_relative '../../src/Exceptions/match_error'
require_relative '../../src/Comparable/any'
require_relative '../../src/Comparable/comparable_class'
require_relative '../../src/Comparable/comparable_hierarchy'
require_relative '../../src/Comparable/comparable_condition'

class PatternMatchingAnalizer
  def analize(item, &block)
    @item = item
    self.instance_eval(&block)
    raise MatchError, "No match for #{item.to_s}"
  end

  def _
    Any.new
  end

  def condition(&condition)
    ComparableCondition.new(&condition)
  end

  def type(klass)
    ComparableClass.new(klass)
  end

  def hierarchy(klass)
    ComparableHierarchy.new(klass)
  end

  def is(comparable, &block)
    if (comparable == (@item))
      raise ExecutableException.new(block)
    end
  end
end