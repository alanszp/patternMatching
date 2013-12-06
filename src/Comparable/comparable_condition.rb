class ComparableCondition
  def initialize(&condition)
    @condition= condition
  end
  def ==(other)

    begin
      @condition.call(other)
    rescue
      return false
    end

  end
end