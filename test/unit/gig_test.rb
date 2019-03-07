require File.dirname(__FILE__) + '/../test_helper'

class GigTest < Test::Unit::TestCase
  fixtures :gigs

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Gig, gigs(:first)
  end
end
