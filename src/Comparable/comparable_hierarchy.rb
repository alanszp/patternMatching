class ComparableHierarchy
  def initialize(klass)
    @klass = klass
  end

  def ==(other)
    other.class.ancestors.include? @klass
  end
end