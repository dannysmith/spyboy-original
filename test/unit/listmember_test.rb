require File.dirname(__FILE__) + '/../test_helper'

class ListmemberTest < Test::Unit::TestCase
  fixtures :listmembers

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Listmember, listmembers(:first)
  end
end
