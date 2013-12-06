class ComparableClass
  def initialize(klass)
    @klass = klass
  end

  def ==(other)
    other.class == @klass
  end
end