require 'abstract_unit'
require 'active_support/core_ext/class'

class A
end

module X
  class B
  end
end

module Y
  module Z
    class C
    end
  end
end

class ClassTest < Test::Unit::TestCase
  def test_removing_class_in_root_namespace
    assert A.is_a?(Class)
    Class.remove_class(A)
    assert_raise(NameError) { A.is_a?(Class) }
  end

  def test_removing_class_in_one_level_namespace
    assert X::B.is_a?(Class)
    Class.remove_class(X::B)
    assert_raise(NameError) { X::B.is_a?(Class) }
  end

  def test_removing_class_in_two_level_namespace
    assert Y::Z::C.is_a?(Class)
    Class.remove_class(Y::Z::C)
    assert_raise(NameError) { Y::Z::C.is_a?(Class) }
  end
end
